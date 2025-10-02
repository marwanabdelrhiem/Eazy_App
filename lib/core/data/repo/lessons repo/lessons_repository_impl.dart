import 'package:eazy/core/data/model/categories_response.dart';
import 'package:eazy/core/data/model/category.dart';
import 'package:eazy/core/data/model/lesson.dart';

import 'lessons_remote_data_source.dart';
import 'lessons_repository.dart';

class LessonsRepositoryImpl implements LessonsRepository {
  final LessonsRemoteDataSource remote;

  LessonsRepositoryImpl(this.remote);

  @override
  Future<CategoriesResponse> getCategories() async {
    final data = await remote.getCategories();
    return CategoriesResponse.fromJson(data);
  }

  @override
  Future<Lesson> getLesson(int id) async {
    final data = await remote.getLesson(id);
    return Lesson.fromJson(data);
  }
}
