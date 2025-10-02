
import 'package:eazy/core/data/model/category.dart';
import 'package:eazy/core/data/model/lesson.dart';

abstract class LessonsRepository {
  Future<Category> getCategories();
  Future<Lesson> getLesson(int id);
}
