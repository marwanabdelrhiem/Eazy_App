import '../../model/start_lesson_response.dart';
import 'my_lessons_remote_data_source.dart';
import 'my_lessons_repository.dart';

class MyLessonsRepositoryImpl implements MyLessonsRepository {
  final MyLessonsRemoteDataSource remote;

  MyLessonsRepositoryImpl(this.remote);

  @override
  Future<StartLessonResponse> startLesson(int lessonId) async {
    final data = await remote.startLesson(lessonId);
    return StartLessonResponse.fromJson(data);
  }
}
