
import '../../network/api_service.dart';

class ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSource(this.apiService);

  Future<Map<String, dynamic>> getProfile() async {
    return await apiService.get('/profile');
  }

  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> body) async {
    return await apiService.post('/update-profile', body);
  }

  Future<Map<String, dynamic>> updatePassword(String oldPass, String newPass) async {
    return await apiService.post('/update-password', {
      "old_password": oldPass,
      "new_password": newPass,
    });
  }

  Future<Map<String, dynamic>> forgetPassword(String email) async {
    return await apiService.post('/forget-password', {
      "email": email,
    });
  }
}
