
import 'package:eazy/core/data/model/categories_response.dart';
import 'package:eazy/core/data/model/category.dart';
import 'package:eazy/core/data/model/lesson.dart';

abstract class LessonsRepository {
  Future<CategoriesResponse> getCategories();
  Future<Lesson> getLesson(int id);
}
