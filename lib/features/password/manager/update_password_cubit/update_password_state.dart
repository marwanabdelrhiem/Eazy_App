import 'package:eazy_app/features/password/data/model/update_password_response.dart';

abstract class UpdatePassState{}
class UpdatePassInitial extends UpdatePassState{}
class UpdatePassLoading extends UpdatePassState{}
class UpdatePassSuccess extends UpdatePassState{
  final UpdatePasswordResponse message;
  UpdatePassSuccess(this.message);
}
class UpdatePassFailure extends UpdatePassState{
  final String message;
  UpdatePassFailure(this.message);
}
class UpdatePassChangePasswordVisibility extends UpdatePassState{}
class UpdatePassChangeConfirmPasswordVisibility extends UpdatePassState{}
class UpdatePassChangeOldPasswordVisibility extends UpdatePassState{}