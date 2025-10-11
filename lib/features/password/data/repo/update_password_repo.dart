import 'package:dartz/dartz.dart';

import '../../../../core/network/api_tools.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../model/update_password_response.dart';

class UpdatePasswordRepo{
  ApiTools apiHelper = ApiTools();
  Future<Either<String,UpdatePasswordResponse>> UpdatePassword({
    required String password,
    required String password_confirmation,
    required String old_password,
  }) async
  {
    try {
      final Map<String, dynamic> data = {
        'password': password,
        'password_confirmation': password_confirmation,
        'old_password': old_password,
      };

      var response = await apiHelper.postRequest(
          endPoint: EndPoints.password,
          isFormData: true,
          isProtected: true,
          data: data,
      );
      if (response.status) {
        return right(UpdatePasswordResponse.fromJson(response.data));
      }
      else {
        return left(response.message);
      }
    }
    catch (e) {
      print(e);
      return Left(ApiResponse
          .fromError(e)
          .message);
    }
  }
}