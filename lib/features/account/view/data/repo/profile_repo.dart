import 'package:dartz/dartz.dart';
import 'package:eazy_app/features/account/view/data/model/profile_model.dart';
import 'package:eazy_app/features/splash&onboarding/data/models/onbordingResponse.dart';

import '../../../../../core/network/api_helper.dart';
import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/end_points.dart';


class ProfileRepo{
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, ProfileResponse>> getProfile() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.profile,
        isProtected: true,

      );

      if (response.status) {
        ProfileResponse profileResponse =
        ProfileResponse.fromJson(response.data);

        return Right(profileResponse);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }


}