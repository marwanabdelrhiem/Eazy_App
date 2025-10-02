
import 'lesson.dart';

class CategoryData {
  final int id;
  final String title;
  final String image;
  final String cover;
  final int status;
  final String content;
  final String createdAt;
  // Fields only present in 'single category' response
  final int? lessonsCount;
  final List<Lesson>? lessons;

  CategoryData({
    required this.id,
    required this.title,
    required this.image,
    required this.cover,
    required this.status,
    required this.content,
    required this.createdAt,
    this.lessonsCount,
    this.lessons,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    // Handle the optional list of lessons
    List<Lesson>? lessonsList;
    if (json['lessons'] != null) {
      lessonsList = (json['lessons'] as List)
          .map((i) => Lesson.fromJson(i as Map<String, dynamic>))
          .toList();
    }

    return CategoryData(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      cover: json['cover'] as String,
      status: json['status'] as int,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      // Optional fields for single category view
      lessonsCount: json['lessons_count'] as int?,
      lessons: lessonsList,
    );
  }
}