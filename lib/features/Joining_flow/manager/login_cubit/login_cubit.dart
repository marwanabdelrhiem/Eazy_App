
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/Auth_repo.dart';
import 'login_states.dart';



class LoginCubit extends Cubit<LoginState>{
  bool isPassword=true;
  var email_phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  static LoginCubit get(context)=>BlocProvider.of(context);
  LoginCubit():super(InitialState());

  void changePasswordVisibility(){
    isPassword=!isPassword;
    emit(ChangePasswordVisibilityState());
  }
  final AuthRepo repo = AuthRepo();


  void onlogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());

    var loginResponse = await repo.login(
      email_phone: email_phoneController.text,
      password: passwordController.text,
    );

    loginResponse.fold(
          (String error) => emit(LoginError(error: error)),
          (loginResponseModel) async {
        emit(LoginSuccess(loginResponseModel: loginResponseModel));
      },
    );
  }



}