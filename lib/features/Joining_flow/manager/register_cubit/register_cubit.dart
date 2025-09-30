import 'package:eazy_app/features/Joining_flow/manager/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/Auth_repo.dart';
class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterInitial());
  bool isPassword = true;
  bool isConfirmPassword = true;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  String? registeredPhone;
  var isChecked = false;
  AuthRepo repo = AuthRepo();
  var formKey = GlobalKey<FormState>();
  static RegisterCubit get(context) => BlocProvider.of(context);
  void changePasswordVisibility(){
    isPassword = !isPassword;
    emit(RegisterChangePasswordVisibility());
  }
  void changeConfirmPasswordVisibility(){
    isConfirmPassword = !isConfirmPassword;
    emit(RegisterChangeConfirmPasswordVisibility());
  }
  void toggleCheckbox(bool value) {
    isChecked = value;
    emit(RegisterToggleCheckbox());
  }
  onRegister()async{
    if(!formKey.currentState!.validate()) return;
    emit(RegisterLoading());
    var registerResponse = await repo.register(
        phone: phoneController.text,
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
    );
    registerResponse.fold(
            (String error)=> emit(RegisterError(error: error)),

            (String message){
              registeredPhone = phoneController.text;
              emit(RegisterSuccess(message: message));
            }
    );
  }
}