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

  // Factory method to handle Dio responses
  factory ApiResponse.fromResponse(Response response) {
    // Check if this is a success response (has status field and it's true)
    bool isSuccess = false;
    String message = '';

    if (response.data is Map<String, dynamic>) {
      // Check for success field first
      if (response.data.containsKey("success")) {
        isSuccess = response.data["success"] == true;
        message = response.data["message"] ?? '';
      }
      // Check for status field (alternative success case)
      else if (response.data.containsKey("status")) {
        isSuccess = response.data["status"] == true || response.data["status"] == 1;
        message = response.data["message"] ?? '';
      }
      // If no success/status field but has message (could be error case)
      else if (response.data.containsKey("message")) {
        // If response has message but no status field, consider it an error
        // unless status code indicates success
        isSuccess = response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
        message = response.data["message"];

        // If there are validation errors, format them nicely
        if (response.data.containsKey("errors") && response.data["errors"] is Map) {
          List<String> errorMessages = [];
          Map<String, dynamic> errors = response.data["errors"];

          errors.forEach((field, fieldErrors) {
            if (fieldErrors is List) {
              for (var error in fieldErrors) {
                errorMessages.add("$field: $error");
              }
            }
          });

          if (errorMessages.isNotEmpty) {
            message = errorMessages.join("\n");
          }
        }
      }
      // If no status or message field, use status code to determine success
      else {
        isSuccess = response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
        message = response.statusMessage ?? '';
      }
    } else {
      // If response data is not a map, use status code
      isSuccess = response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
      message = response.statusMessage ?? '';
    }

    return ApiResponse(
      status: isSuccess,
      statusCode: response.statusCode ?? 500,
      data: response.data,
      message: message,
    );
  }

  factory ApiResponse.fromError(dynamic error) {
    print(error.toString());
    if (error is DioException) {
      return ApiResponse(
        status: false,
        data: error.response?.data,
        statusCode: error.response != null ? error.response!.statusCode ?? 500 : 500,
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

      // Check for message field
      if (data["message"] != null) {
        print("----- Handle Server Error ${data["message"]}");
        String message = data["message"];

        // Check for validation errors
        if (data.containsKey("errors") && data["errors"] is Map) {
          List<String> errorMessages = [];
          Map<String, dynamic> errors = data["errors"];

          errors.forEach((field, fieldErrors) {
            if (fieldErrors is List) {
              for (var error in fieldErrors) {
                errorMessages.add("$field: $error");
              }
            }
          });

          if (errorMessages.isNotEmpty) {
            message = errorMessages.join("\n");
          }
        }

        return message;
      }

      return "An error occurred.";
    }

    return "Server error: ${response.statusMessage}";
  }
}