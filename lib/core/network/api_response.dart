import 'package:dio/dio.dart';

class ApiResponse {
  final bool status;
  final int statusCode;
  final dynamic data;
  final String message;

  ApiResponse({
    required this.status,
    required this.statusCode,
    this.data,
    required this.message,
  });

  /// Factory method to handle Dio responses
  factory ApiResponse.fromResponse(Response response) {
    bool isSuccess = false;
    String message = '';

    if (response.data is Map<String, dynamic>) {
      // ✅ الحالة الطبيعية: السيرفر رجع JSON
      if (response.data.containsKey("success")) {
        isSuccess = response.data["success"] == true;
        message = response.data["message"] ?? '';
      } else if (response.data.containsKey("status")) {
        isSuccess = response.data["status"] == true || response.data["status"] == 1;
        message = response.data["message"] ?? '';
      } else if (response.data.containsKey("message")) {
        isSuccess = response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300;
        message = response.data["message"];
      } else {
        isSuccess = response.statusCode != null &&
            response.statusCode! >= 200 &&
            response.statusCode! < 300;
        message = response.statusMessage ?? '';
      }
    } else {
      // ❌ الحالة دي لما السيرفر يرجع HTML أو String
      isSuccess = response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300;

      if (response.data is String &&
          response.data.toString().startsWith("<!DOCTYPE html>")) {
        message = "Server returned unexpected HTML page.";
      } else {
        message = response.statusMessage ?? 'Unexpected response format';
      }
    }

    return ApiResponse(
      status: isSuccess,
      statusCode: response.statusCode ?? 500,
      data: response.data,
      message: message,
    );
  }

  /// Factory method to handle Dio errors
  factory ApiResponse.fromError(dynamic error) {
    print(error.toString());
    if (error is DioException) {
      return ApiResponse(
        status: false,
        data: error.response?.data,
        statusCode:
        error.response != null ? error.response!.statusCode ?? 500 : 500,
        message: _handleDioError(error),
      );
    } else {
      return ApiResponse(
        status: false,
        statusCode: 500,
        message: 'An error occurred.',
      );
    }
  }

  /// Handling Dio errors
  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again.";
      case DioExceptionType.sendTimeout:
        return "Send timeout, please check your internet.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout, please try again later.";
      case DioExceptionType.badResponse:
        return _handleServerError(error.response);
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        return "No internet connection.";
      default:
        return "Unknown error occurred.";
    }
  }

  /// Handling errors from the server response
  static String _handleServerError(Response? response) {
    if (response == null) return "No response from server.";

    if (response.data is Map<String, dynamic>) {
      Map<String, dynamic> data = response.data;
      if (data["message"] != null) {
        return data["message"]; // ✅ رجّع الرسالة الكبيرة بس
      }
      return "An error occurred.";
    }

    // ❌ لو السيرفر رجع HTML
    if (response.data is String &&
        response.data.toString().startsWith("<!DOCTYPE html>")) {
      return "Server returned unexpected HTML page.";
    }

    return "Server error: ${response.statusMessage}";
  }
}
