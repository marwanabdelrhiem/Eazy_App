import 'package:eazy_app/features/Joining_flow/data/models/otp_respons.dart';
import 'package:eazy_app/features/Joining_flow/data/models/verifay_response.dart';

abstract class OtpState{}
class OtpInitial extends OtpState {}
class OtpLoading extends OtpState {}
class OtpSuccess extends OtpState {
  final Verfiyrespons message;
 OtpSuccess(this.message);
}
class OtpError extends OtpState {
  final String error;
  OtpError(this.error);

}