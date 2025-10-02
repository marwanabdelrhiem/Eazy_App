class TermsResponse {
  final bool status;
  final String message;
  final String? data;

  TermsResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory TermsResponse.fromJson(Map<String, dynamic> json) {
    return TermsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}
