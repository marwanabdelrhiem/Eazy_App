class VerifyResponse {
  final bool status;
  final String message;

  VerifyResponse({
    required this.status,
    required this.message,
  });

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
