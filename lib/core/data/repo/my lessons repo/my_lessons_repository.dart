
import '../../model/start_lesson_response.dart';

abstract class MyLessonsRepository {
  Future<StartLessonResponse> startLesson(int lessonId);
}
