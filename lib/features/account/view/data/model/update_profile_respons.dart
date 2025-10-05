class UpdateProfileResponse {
  final bool success;
  final String message;

  UpdateProfileResponse({
    required this.success,
    required this.message,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    dynamic successValue = json['success'];

    bool parsedSuccess;
    if (successValue is bool) {
      parsedSuccess = successValue;
    } else if (successValue is Map && successValue.containsKey("status")) {
      parsedSuccess = successValue["status"] == true;
    } else if (successValue is String) {
      parsedSuccess = successValue.toLowerCase() == "true";
    } else {
      parsedSuccess = false;
    }

    return UpdateProfileResponse(
      success: parsedSuccess,
      message: json['message']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
