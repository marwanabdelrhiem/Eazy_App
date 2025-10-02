
import 'package:eazy/core/data/model/lesson.dart';

class LessonResponse {
  final bool status;
  final String message;
  final Lesson? data;

  LessonResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory LessonResponse.fromJson(Map<String, dynamic> json) {
    return LessonResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? Lesson.fromJson(json['data']) : null,
    );
  }
}
