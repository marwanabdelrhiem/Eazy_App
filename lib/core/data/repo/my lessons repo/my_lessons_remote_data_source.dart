
import '../../network/api_service.dart';

class MyLessonsRemoteDataSource {
  final ApiService apiService;

  MyLessonsRemoteDataSource(this.apiService);

  Future<Map<String, dynamic>> startLesson(int lessonId) async {
    return await apiService.post('/lessons/start', {
      "lesson_id": lessonId,
    });
  }
}
