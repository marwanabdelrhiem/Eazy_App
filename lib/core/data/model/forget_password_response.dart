class ForgetPasswordResponse {
  final bool status;
  final String message;

  ForgetPasswordResponse({
    required this.status,
    required this.message,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
