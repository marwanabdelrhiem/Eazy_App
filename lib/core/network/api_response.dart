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

  factory ApiResponse.fromResponse(Response response) {
    bool success = response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300;

    String message = "";
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      message = data['message']?.toString() ?? "";
    } else {
      message = response.statusMessage ?? "Success";
    }

    return ApiResponse(
      status: success,
      statusCode: response.statusCode ?? 500,
      data: response.data,
      message: message,
    );
  }

  factory ApiResponse.fromError(dynamic error) {
    if (error is DioException) {
      return ApiResponse(
        status: false,
        statusCode: error.response?.statusCode ?? 500,
        message: error.response?.data?["message"]?.toString() ??
            "Something went wrong",
        data: error.response?.data,
      );
    } else {
      return ApiResponse(
        status: false,
        statusCode: 500,
        message: "Unknown error occurred",
      );
    }
  }
}
