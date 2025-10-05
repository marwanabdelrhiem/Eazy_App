import 'package:dartz/dartz.dart';
import 'package:eazy_app/features/home/data/model/home_model.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
class HomeRepo{
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, HomeResponse>> getHomeData() async {
  try {
  var response = await apiHelper.getRequest(
  endPoint: EndPoints.home,
  isProtected: true,
  );
  if (response.status) {
  HomeResponse homeResponse =
 HomeResponse.fromJson(response.data);
  return Right(homeResponse);
  } else {
  return Left(response.message);
  }
  } catch (e) {
  return Left(e.toString());
  }

  }
}