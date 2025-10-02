import '../../network/api_service.dart';

class AuthRemoteDataSource {
  final ApiService api;

  AuthRemoteDataSource(this.api);

  Future<Map<String, dynamic>> login(String emailOrPhone, String password) async {
    return await api.post("/login", {
      "email_phone": emailOrPhone,
      "password": password,
    });
  }

  Future<Map<String, dynamic>> register(String name, String email, String phone, String password) async {
    return await api.post("/register", {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });
  }

  Future<Map<String, dynamic>> otp(String phone) async {
    return await api.post("/otp", {
      "phone": phone,
    });
  }

  Future<Map<String, dynamic>> verify(String phone, String otp) async {
    return await api.post("/verify", {
      "phone": phone,
      "otp": otp,
    });
  }
}
