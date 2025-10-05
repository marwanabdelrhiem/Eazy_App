import 'package:dartz/dartz.dart';
import 'package:eazy_app/features/splash&onboarding/data/models/onbordingResponse.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class OnbordingRepo{
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, List<Data>>> getOnboarding() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.onbording,
        isProtected: true,
      );

      if (response.status) {
        OnBordingResponse onBoardingResponse =
        OnBordingResponse.fromJson(response.data);

        return Right(onBoardingResponse.data ?? []);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }


}