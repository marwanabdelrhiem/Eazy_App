
import 'auth_remote_data_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future login(String emailOrPhone, String password) {
    return remoteDataSource.login(emailOrPhone, password);
  }

  @override
  Future register(String name, String email, String phone, String password) {
    return remoteDataSource.register(name, email, phone, password);
  }

  @override
  Future otp(String phone) {
    return remoteDataSource.otp(phone);
  }

  @override
  Future verify(String phone, String otp) {
    return remoteDataSource.verify(phone, otp);
  }
}
