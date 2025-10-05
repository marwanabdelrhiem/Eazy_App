import 'package:eazy_app/features/password/data/repo/update_password_repo.dart';
import 'package:eazy_app/features/password/manager/update_password_cubit/update_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/update_password_response.dart';

class UpdatePassCubit extends Cubit<UpdatePassState>{
  UpdatePassCubit() : super(UpdatePassInitial());
  static UpdatePassCubit get(context) => BlocProvider.of(context);
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var oldPasswordController = TextEditingController();
  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isOldPassword = true;
  var formKey = GlobalKey<FormState>();
  UpdatePasswordRepo repo = UpdatePasswordRepo();
  void changePasswordVisibility(){
    isPassword = !isPassword;
    emit(UpdatePassChangePasswordVisibility());
  }
  void changeConfirmPasswordVisibility(){
    isConfirmPassword = !isConfirmPassword;
    emit(UpdatePassChangeConfirmPasswordVisibility());
  }
  void changeOldPasswordVisibility(){
    isOldPassword = !isOldPassword;
    emit(UpdatePassChangeOldPasswordVisibility());
  }
  onUpdatePassword()async{
    if(!formKey.currentState!.validate()) return;
    emit(UpdatePassLoading());
    var updatePasswordResponse = await repo.UpdatePassword(
      password: passwordController.text,
      password_confirmation: confirmPasswordController.text,
      old_password: oldPasswordController.text,
    );
    updatePasswordResponse.fold(
            (String error)=> emit(UpdatePassFailure(error)),
            (UpdatePasswordResponse message){
          emit(UpdatePassSuccess(message));
        }
    );
  }


}