import 'package:eazy_app/features/Joining_flow/data/repos/Auth_repo.dart';
import 'package:eazy_app/features/Joining_flow/manager/otp_cubit/otp_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OtpCubit extends Cubit<OtpState> {
  final authRepo = AuthRepo();
  OtpCubit() : super(OtpInitial());
  static OtpCubit get(context) => BlocProvider.of(context);

  Future<void> Otp({
    required String phone,
    required String otp,
  }) async {
    emit(OtpLoading());
    var verifyResponse = await authRepo.Otp(
      phone: phone,
      otp: otp,
    );
    verifyResponse.fold(
          (String error) => emit(OtpError(error)),
          (message) => emit(OtpSuccess(message)),
    );
  }
}