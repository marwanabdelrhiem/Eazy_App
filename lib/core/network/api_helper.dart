import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_response.dart';
import 'end_points.dart';

class ApiHelper {
  // singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() {
    _instance.initDio();
    return _instance;
  }
  ApiHelper._init();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.ecoBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  void initDio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("--- Headers : ${options.headers.toString()}");
          print("--- endpoint : ${options.path.toString()}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // لو السيرفر رجع HTML بدل JSON
          if (response.data is String &&
              response.data.toString().startsWith("<!DOCTYPE html>")) {
            print("--- Response was HTML, not JSON");
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                type: DioExceptionType.badResponse,
                error: "Server returned unexpected HTML page.",
              ),
            );
          }

          print("--- Response : ${response.data.toString()}");
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          print("--- Error : ${error.response?.data.toString()}");

          bool isTokenExpired = false;

          if (error.response?.data != null) {
            if (error.response!.data is Map<String, dynamic>) {
              final data = error.response!.data as Map<String, dynamic>;

              // Method 1: Check if message contains 'expired'
              if (data['message']?.toString().contains('expired') == true) {
                isTokenExpired = true;
              }
              // Method 2: Check for specific error codes
              else if (error.response?.statusCode == 401) {
                isTokenExpired = true;
              }
              // Method 3: Check for specific status in response
              else if (data['status'] == 0 || data['status'] == false) {
                isTokenExpired = true;
              }
            } else if (error.response!.data is String &&
                error.response!.data.toString().startsWith("<!DOCTYPE html>")) {
              // السيرفر رجع HTML بدل JSON
              print("--- Server returned HTML instead of JSON");
            }
          }

          if (isTokenExpired) {
            print("--- Token expired - logging out user");
            await _logoutUser();
          }

          return handler.next(error);
        },
      ),
    );
  }

  // Logout helper method
  Future<void> _logoutUser() async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.remove('access_token');
      await sharedPreferences.remove('refresh_token');
      await sharedPreferences.remove('user_data');

      print("--- User logged out successfully");
    } catch (e) {
      print("--- Error during logout: $e");
    }
  }

  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString('access_token');
    }

    try {
      final response = await dio.post(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString('access_token');
    }

    try {
      final response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = true,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString('access_token');
    }

    try {
      final response = await dio.delete(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString('access_token');
    }

    try {
      final response = await dio.put(
        endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}
