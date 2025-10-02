

class SettingResponse {
  final bool status;
  final String message;
  final Map<String, dynamic>? data;

  SettingResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory SettingResponse.fromJson(Map<String, dynamic> json) {
    return SettingResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}