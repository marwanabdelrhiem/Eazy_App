class Lesson {
  final String title;
  final String subtitle;
  final int progress; // من 0 لـ 100
  final bool isBookmarked;

  Lesson({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.isBookmarked,
  });
}