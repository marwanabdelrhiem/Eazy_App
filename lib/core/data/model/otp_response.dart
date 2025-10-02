class OtpResponse {
  final bool status;
  final String message;

  OtpResponse({
    required this.status,
    required this.message,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
