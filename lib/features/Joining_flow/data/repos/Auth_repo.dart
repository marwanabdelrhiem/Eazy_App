import 'package:dartz/dartz.dart';
import 'package:eazy_app/features/Joining_flow/data/models/otp_respons.dart';
import 'package:eazy_app/features/Joining_flow/data/models/verifay_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/login_response_model.dart';

class AuthRepo {
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String,String>> register({
    required String phone,
    required String name,
    required String email,
    required String password,
  }) async
  {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,

      };

      var response = await apiHelper.postRequest(
          endPoint: EndPoints.register,
          data: data

      );
      if (response.status) {
        return right(response.message);
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


  Future<Either<String, LoginResponseModel>> login({
    required String email_phone,
    required String password,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {
          'email_phone': email_phone,
          'password': password,
        },
      );
      print("🔹 Login Response Data: ${response.data}");
      if (response.status) {
        final loginResponseModel =
        LoginResponseModel.fromJson(response.data as Map<String, dynamic>);

        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString(
            'access_token', loginResponseModel.accessToken ?? '');
        return Right(loginResponseModel);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      print(e);
      return Left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String,otprespons>>verify({
    required String phone,
    })async{
    try {
      final Map<String, dynamic> data = {
        'phone': phone,
        };
      var response = await apiHelper.postRequest(
          endPoint: EndPoints.otp,
          data: data,
          isFormData: true,
      );
      if (response.status) {
        return right(otprespons.fromJson(response.data));
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
  Future<Either<String,Verfiyrespons>>Otp({
    required String phone,
    required String otp,
  })async{
    try {
      final Map<String, dynamic> data = {
        'phone': phone,
        'otp': otp,
      };
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.verify,
        data: data,
        isFormData: true,
      );
      if (response.status) {
        return right(Verfiyrespons.fromJson(response.data));
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