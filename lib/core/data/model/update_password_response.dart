class UpdatePasswordResponse {
  final bool status;
  final String message;

  UpdatePasswordResponse({
    required this.status,
    required this.message,
  });

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
