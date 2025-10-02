abstract class AuthRepository {
  Future<dynamic> login(String emailOrPhone, String password);
  Future<dynamic> register(String name, String email, String phone, String password);
  Future<dynamic> otp(String phone);
  Future<dynamic> verify(String phone, String otp);
}
