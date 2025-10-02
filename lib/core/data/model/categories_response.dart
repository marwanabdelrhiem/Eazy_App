import 'package:eazy/core/data/model/category.dart';

class CategoriesResponse {
  final bool status;
  final String message;
  final List<CategoryData> data;

  CategoriesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => CategoryData.fromJson(e))
          .toList(),
    );
  }
}
