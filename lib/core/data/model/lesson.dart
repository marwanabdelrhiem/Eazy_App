class Lesson {
  final int id;
  final String title;
  final String content;
  final int categoryId;
  final String? image;
  final String? gallery;
  final String? audio;
  final int status;
  final int views;
  final int order;
  final int paid;
  final String createdAt;
  final String updatedAt;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.categoryId,
    this.image,
    this.gallery,
    this.audio,
    required this.status,
    required this.views,
    required this.order,
    required this.paid,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      categoryId: json['category_id'] as int,
      // Nullable fields
      image: json['image'] as String?,
      gallery: json['gallery'] as String?,
      audio: json['audio'] as String?,
      status: json['status'] as int,
      views: json['views'] as int,
      order: json['order'] as int,
      paid: json['paid'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}