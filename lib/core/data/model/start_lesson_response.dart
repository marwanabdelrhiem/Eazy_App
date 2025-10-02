class StartLessonResponse {
  final bool status;
  final String message;

  StartLessonResponse({
    required this.status,
    required this.message,
  });

  factory StartLessonResponse.fromJson(Map<String, dynamic> json) {
    return StartLessonResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
