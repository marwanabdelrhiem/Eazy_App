import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:eazy_app/core/widgets/textField.dart';
import 'package:eazy_app/features/password/forget_password.dart';
import 'package:eazy_app/features/password/manager/update_password_cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/app_pop_up.dart';
import '../../../core/helper/app_validators.dart';
import '../manager/update_password_cubit/update_password_state.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => UpdatePassCubit(),
  child: Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: BlocConsumer<UpdatePassCubit, UpdatePassState>(
               listener: (context, state) {
                 if(state is UpdatePassSuccess){
         final cubit = UpdatePassCubit.get(context);
         AppPopUp.showToast(state.message.message!, AppColors.blue);
         cubit.passwordController.clear();
         cubit.confirmPasswordController.clear();
         cubit.oldPasswordController.clear();
                 }else if(state is UpdatePassFailure){
         AppPopUp.showToast(state.message, AppColors.red);
                 }else if(state is UpdatePassLoading){
         const Center(child: CircularProgressIndicator(),);
                 }
               },
          builder: (context, state) {
                 final cubit = UpdatePassCubit.get(context);
            return Form(
              key: cubit.formKey,
              child: Column(children: [
                        CustomAppBar(title: "تغير كلمة المرور",),
                        SizedBox(height: MediaQuery.of(context).size.height/40,),
                        CustomTextField(hintText: "كلمة المرور القديمة",
                          controller: cubit.oldPasswordController,
                          obscureText: cubit.isOldPassword,
                          validator: AppValidator.passwordValidator,
                          prefixIcon: IconButton(onPressed: (){
                            cubit.changeOldPasswordVisibility();
                          }, icon: CustomSvg(path: cubit.isOldPassword?AppIcons.eyeOn:AppIcons.eyeOff,
                            width: 25.w,
                            height: 25.h,
                            color: AppColors.gray3,)),),
                         SizedBox(height: MediaQuery.of(context).size.height/40,),
                        CustomTextField(
                            hintText: " كلمة المرور الجديدة",
                            obscureText: cubit.isPassword,
                            controller: cubit.passwordController,
                            validator: AppValidator.passwordValidator,
                            prefixIcon: IconButton(onPressed: (){
                              cubit.changePasswordVisibility();
                            }, icon: CustomSvg(path: cubit.isPassword?AppIcons.eyeOn:AppIcons.eyeOff,
                              width: 25.w,
                              height: 25.h,
                              color: AppColors.gray3,))),
                         SizedBox(height: MediaQuery.of(context).size.height/40,),
                        CustomTextField(
                            hintText: "اعادة ادخال كلمة المرور الجديدة",
                            obscureText: cubit.isConfirmPassword,
                            controller:cubit.confirmPasswordController,
                            validator: (value) => AppValidator.confirmPasswordValidator(
                              value,
                              cubit.passwordController.text,
                            ),
                            prefixIcon: IconButton(onPressed: (){
                              cubit.changeConfirmPasswordVisibility();
                            }, icon: CustomSvg(path: cubit.isConfirmPassword?AppIcons.eyeOn:AppIcons.eyeOff,
                              width: 25.w,
                              height: 25.h,
                              color: AppColors.gray3,))),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                         children: [
               Padding(
                 padding: const EdgeInsets.only(right: 20,top: 15),
                 child: GestureDetector(
                  onTap: () => MyNavigator.goTo(context, ForgetPassword()),
                  child: Text(" نسيت كلمة السر ؟",style: AppStyles.textStyle12w400FF.copyWith(color: AppColors.firstQus),)),
               ),
                         ],
                       ),
                       Spacer(flex: 7,),
                        CustomBtn(
                         height: 48.h,
              width: 335.w,
                        text: "حفظ التعديلات", onPressed: (){
                           cubit.onUpdatePassword();
                        }),
                        Spacer(flex: 1,),
                      ],),
            );
          },
        ),
      ),
    ),
);
  }
}