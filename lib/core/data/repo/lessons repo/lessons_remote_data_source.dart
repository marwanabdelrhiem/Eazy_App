
import '../../network/api_service.dart';

class LessonsRemoteDataSource {
  final ApiService apiService;

  LessonsRemoteDataSource(this.apiService);

  Future<Map<String, dynamic>> getCategories() async {
    return await apiService.get('/categories');
  }

  Future<Map<String, dynamic>> getLesson(int id) async {
    return await apiService.get('/lessons/$id');
  }
}
