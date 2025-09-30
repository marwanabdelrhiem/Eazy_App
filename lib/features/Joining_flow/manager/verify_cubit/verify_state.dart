import 'package:eazy_app/features/Joining_flow/data/models/otp_respons.dart';

abstract class VerifyState{}
class VerifyInitial extends VerifyState {}
class VerifyLoading extends VerifyState {}
class VerifySuccess extends VerifyState {
  final otprespons message;
  VerifySuccess(this.message);
}
class VerifyError extends VerifyState {
  final String error;
  VerifyError(this.error);

}