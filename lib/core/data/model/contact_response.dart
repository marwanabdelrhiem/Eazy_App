class ContactResponse {
  final bool status;
  final String message;

  ContactResponse({
    required this.status,
    required this.message,
  });

  factory ContactResponse.fromJson(Map<String, dynamic> json) {
    return ContactResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
