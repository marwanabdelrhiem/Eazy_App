import 'package:dartz/dartz.dart';
import '../../../../core/network/api_tools.dart';
import '../../../../core/network/end_points.dart';
import '../models/single_catgory_response.dart';
class SingelCatgoryRepo{
  ApiTools apiHelper = ApiTools();
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