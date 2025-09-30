



import '../../data/models/login_response_model.dart';

abstract class LoginState {}
class InitialState extends LoginState{}
class ChangePasswordVisibilityState extends LoginState{}
class LoginLoading  extends LoginState{}
class LoginSuccess  extends LoginState
{
  LoginResponseModel loginResponseModel;
  LoginSuccess({required this.loginResponseModel});
}
class LoginError extends LoginState {
  String error;

  LoginError({required this.error});
}