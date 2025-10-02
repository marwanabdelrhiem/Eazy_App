
import '../../network/api_service.dart';

class GeneralRemoteDataSource {
  final ApiService apiService;

  GeneralRemoteDataSource(this.apiService);

  Future<Map<String, dynamic>> getSettings() async {
    return await apiService.get('/settings');
  }

  Future<Map<String, dynamic>> getTerms() async {
    return await apiService.get('/terms');
  }

  Future<Map<String, dynamic>> getNotifications() async {
    return await apiService.get('/notifications');
  }

  Future<Map<String, dynamic>> sendContact(Map<String, dynamic> body) async {
    return await apiService.post('/contact', body);
  }
}
