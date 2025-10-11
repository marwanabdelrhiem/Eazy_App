import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/network/api_tools.dart';
import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/end_points.dart';
import '../model/update_profile_respons.dart';
class UpdateProfileRepo {
  Future<Either<String, UpdateProfileResponse>> updateProfile({
    required String name,
    required String phone,
    XFile? image,
    required String email,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "name": name,
        "phone": phone,
        "email": email,
      };

      if (image != null) {
        data["image"] = await MultipartFile.fromFile(
          image.path,
          filename: image.name,
        );
      }
      ApiTools apiHelper = ApiTools ();
      ApiResponse response = await apiHelper.postRequest(
        endPoint: EndPoints.profile,
        data: data,
        isProtected: true,
        isFormData: true,
      );

      if (response.status) {
        // هنا اتأكد إن response.data Map
        if (response.data is Map<String, dynamic>) {
          final UpdateProfileResponse result =
          UpdateProfileResponse.fromJson(response.data);
          return Right(result);
        } else {
          return Left("Unexpected response format: ${response.data}");
        }
      } else {
        return Left(response.message ?? "حدث خطأ غير متوقع");
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ApiResponse
            .fromError(e)
            .message ?? "خطأ في الاتصال بالسيرفر");
      }
      return Left(e.toString());
    }
  }
}