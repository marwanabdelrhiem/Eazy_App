import 'package:dartz/dartz.dart';
import '../../../../core/network/api_tools.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/contact_response.dart';
class ContactRepo{
  ApiTools apiHelper = ApiTools();
  Future<Either<String, contactResponse>> contact
      ({
    required String title,
    required String message,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'title': title,
        'message': message,
      };
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.contact,
        isProtected: true,
        data: data,
      );
      if (response.status) {
        return Right(contactResponse.fromJson(response.data));
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}