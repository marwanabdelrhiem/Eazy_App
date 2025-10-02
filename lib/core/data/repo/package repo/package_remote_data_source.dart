
import '../../network/api_service.dart';

class PackageRemoteDataSource {
  final ApiService apiService;

  PackageRemoteDataSource(this.apiService);

  Future<Map<String, dynamic>> getPackages() async {
    return await apiService.get('/packages');
  }
}
