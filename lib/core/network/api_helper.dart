import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_response.dart';
import 'end_points.dart';

class ApiHelper
{
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
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
      )
  );

  void initDio() {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          print("--- Headers : ${options.headers.toString()}");
          print("--- endpoint : ${options.path.toString()}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("--- Response : ${response.data.toString()}");
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          print("--- Error : ${error.response?.data.toString()}");

          // Check for token expiration in different ways
          bool isTokenExpired = false;

          if (error.response?.data != null) {
            // Method 1: Check if message contains 'expired'
            if (error.response?.data['message']?.toString().contains('expired') == true) {
              isTokenExpired = true;
            }
            // Method 2: Check for specific error codes
            else if (error.response?.statusCode == 401) {
              isTokenExpired = true;
            }
            // Method 3: Check for specific status in response
            else if (error.response?.data['status'] == 0 ||
                error.response?.data['status'] == false) {
              isTokenExpired = true;
            }
          }

          if(isTokenExpired)
          {
            // Token expired - logout user
            print("--- Token expired - logging out user");
            await _logoutUser();
            return handler.next(error);
          }

          return handler.next(error);
        }
    ));

  }

  // Logout helper method
  Future<void> _logoutUser() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.remove('access_token');
      await sharedPreferences.remove('refresh_token');
      await sharedPreferences.remove('user_data'); // إضافة أي data تاني محفوظ للـ user

      // يمكنك إضافة navigation للـ login screen هنا
      // أو استخدام event bus/state management للإشعار بالـ logout
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
  }) async
  {
    String? token;
    if(isProtected){
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString('access_token');
    }
    return ApiResponse.fromResponse(await dio.post(
        endPoint,
        data: isFormData? FormData.fromMap(data??{}): data,
        options: Options(
            headers: {
              if(isProtected)'Authorization': 'Bearer $token'
            }
        )
    ));
  }

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
    bool isProtected = false,
  }) async
  {
    String? token;
    if(isProtected){
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString('access_token');
    }
    return ApiResponse.fromResponse(await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: isFormData? FormData.fromMap(data??{}): data,
        options: Options(
            headers: {
              if(isProtected)'Authorization': 'Bearer $token'
            }
        )
    ));
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

    return ApiResponse.fromResponse(await dio.delete(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(
        headers: {
          if (isProtected) 'Authorization': 'Bearer $token',
        },
      ),
    ));
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
    return ApiResponse.fromResponse(
      await dio.put(
        endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected) 'Authorization': 'Bearer $token',
          },
        ),
      ),
    );
  }


}