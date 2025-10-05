import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/Joining_flow/views/login_screen.dart';
import 'api_response.dart';
import 'end_points.dart';
import 'nav.dart';

class ApiHelper {
  // ✅ Singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() {
    _instance._initDio();
    return _instance;
  }
  ApiHelper._init();

  late Dio dio;

  void _initDio() {
    dio = Dio(
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

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // ✅ إضافة التوكن في كل طلب
          final sharedPref = await SharedPreferences.getInstance();
          final token = sharedPref.getString('access_token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // ✅ التأكد إن السيرفر مرجعش HTML
          if (response.data is String &&
              response.data.toString().startsWith("<!DOCTYPE html>")) {
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                type: DioExceptionType.badResponse,
                error: "Server returned unexpected HTML page.",
              ),
            );
          }
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          bool isTokenExpired = false;

          // ✅ التحقق من انتهاء صلاحية التوكن أو الكود 401
          if (error.response?.statusCode == 401) {
            isTokenExpired = true;
          } else if (error.response?.data is Map<String, dynamic>) {
            final data = error.response!.data as Map<String, dynamic>;
            if (data['message']?.toString().contains('expired') == true ||
                data['status'] == 0 ||
                data['status'] == false) {
              isTokenExpired = true;
            }
          }

          if (isTokenExpired) {
            await _handleExpiredToken();
          }

          return handler.next(error);
        },
      ),
    );
  }

  // ✅ التعامل مع انتهاء التوكن
  Future<void> _handleExpiredToken() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.remove('access_token');
      await sharedPref.remove('refresh_token');
      await sharedPref.remove('user_data');

      // 🔥 التوجيه لصفحة تسجيل الدخول
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
      );

      // 💬 عرض رسالة للمستخدم
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(
          content: Text("Session expired, please login again."),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      debugPrint("Logout error: $e");
    }
  }

  // ✅ POST
  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      final token = sharedPref.getString('access_token');

      final response = await dio.post(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isProtected && token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  // ✅ GET
  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isProtected = false,
  }) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      final token = sharedPref.getString('access_token');

      final response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            if (isProtected && token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  // ✅ PUT
  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isProtected = false,
  }) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      final token = sharedPref.getString('access_token');

      final response = await dio.put(
        endPoint,
        data: data,
        options: Options(
          headers: {
            if (isProtected && token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  // ✅ DELETE
  Future<ApiResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isProtected = false,
  }) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      final token = sharedPref.getString('access_token');

      final response = await dio.delete(
        endPoint,
        data: data,
        options: Options(
          headers: {
            if (isProtected && token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
}
