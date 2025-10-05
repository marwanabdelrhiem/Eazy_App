import 'package:dartz/dartz.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import '../models/single_catgory_response.dart';
class SingelCatgoryRepo{
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, SingleCatgoryResponse>>
  getSingelCatgoryData(int id) async {
  try {
  var response = await apiHelper.getRequest(
  endPoint: EndPoints.catgory(id: id),
  isProtected: true,
  );
  if (response.status) {
  SingleCatgoryResponse singleCatgoryResponse =
  SingleCatgoryResponse.fromJson(response.data);
  return Right(singleCatgoryResponse);
  } else {
  return Left(response.message);
  }
  } catch (e) {
  return Left(e.toString());
  }

  }
}