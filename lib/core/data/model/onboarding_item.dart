class OnboardingItem {
  final int id;
  final String title;
  final String content;
  final int status;
  final String image;
  final String createdAt;
  final String updatedAt;

  OnboardingItem({
    required this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OnboardingItem.fromJson(Map<String, dynamic> json) {
    return OnboardingItem(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      status: json['status'] as int,
      image: json['image'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}