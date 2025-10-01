import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/CustomButton.dart';
import 'package:eazy_app/core/widgets/CustomSvg.dart';
import 'package:eazy_app/core/widgets/textField.dart';
import 'package:eazy_app/features/Joining_flow/manager/register_cubit/register_cubit.dart';
import 'package:eazy_app/features/Joining_flow/views/Otp_screen.dart';
import 'package:eazy_app/features/splash&onboarding/widgets/text_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/helper/app_pop_up.dart';
import '../../../core/helper/app_validators.dart';
import '../../splash&onboarding/background.dart';
import '../manager/register_cubit/register_states.dart';
import '../manager/verify_cubit/verify_cubit.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393.6696472167969, 852),
      builder: (context, child) {
        return Scaffold(
          body: BlocConsumer<RegisterCubit,RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                final phone = RegisterCubit.get(context).registeredPhone!;
                VerifyCubit.get(context).verify(phone: phone);

                MyNavigator.goTo(context, OtpScreen(
                  phone: phone,
                ), type: NavigatorType.push);
                AppPopUp.showToast(state.message,
                    AppColors.blue);
              } else if (state is RegisterError) {
               AppPopUp.showToast(state.error,AppColors.red);
              }
            },

            builder: (context, state) {
               RegisterCubit cubit = RegisterCubit.get(context);
              return Stack(
                children: [
               SplashBackgroundWidget(),
              Padding(
                padding: AppPaddings.mainPadding,
                child: Form(
                  key:cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        TextSplash(),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'تسجيل حساب جديد',
                            textAlign: TextAlign.end,
                            style: AppStyles.textStyle18w700
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          hintText: 'اسم المستخدم',
                          controller: cubit.nameController,
                          backgroundColor: AppColors.white,
                          validator:AppValidator.requiredValidator,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hintText: ' البريد الإلكتروني',
                          controller: cubit.emailController,
                          backgroundColor: AppColors.white,
                          validator:AppValidator.emailValidator,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hintText: ' رقم الهاتف',
                          controller: cubit.phoneController,
                          backgroundColor: AppColors.white,
                          validator:AppValidator.phoneValidator,
                        ),
                        SizedBox(height: 16.h),
                         CustomTextField(
                              hintText: 'كلمة المرور',
                              controller: cubit.passwordController,
                              obscureText: cubit.isPassword,
                              backgroundColor: AppColors.white,
                           validator:AppValidator.passwordValidator,
                           prefixIcon: IconButton(onPressed: (){
                             cubit.changePasswordVisibility();
                           }, icon: CustomSvg(
                             path: cubit.isPassword?AppIcons.eyeOn:AppIcons.eyeOff,
                             color: AppColors.gray,
                             width: 20.w,
                             height: 20.h,
                           ))
                        ),
                        SizedBox(height: 16.h),
                         CustomTextField(
                              hintText: 'أعد ادخال كلمة المرور',
                              controller: cubit.confirmPasswordController,
                              obscureText: cubit.isConfirmPassword,
                              backgroundColor: AppColors.white,
                              validator:  (value) => AppValidator.confirmPasswordValidator(
                                value,
                                cubit.passwordController.text,

                              ),
                           prefixIcon:IconButton(onPressed: (){
                             cubit.changeConfirmPasswordVisibility();
                           }, icon: CustomSvg(
                             path: cubit.isConfirmPassword?AppIcons.eyeOn:AppIcons.eyeOff,
                             color: AppColors.gray,
                             width: 20.w,
                             height: 20.h,
                           )),
                        ),
                        SizedBox(height: 5.h),Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'أوافق على',
                                        style: AppStyles.textStyle12w400LS
                                            .copyWith(color: AppColors.gray4),
                                      ),
                                      TextSpan(
                                        text: ' الشروط والأحكام للاستمرار',
                                        style: AppStyles.textStyle12w400LS.copyWith(
                                          color: AppColors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: AppColors.blue,
                                          decorationThickness: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Checkbox(
                                  value:cubit.isChecked,
                                  onChanged: (value) {
                                    cubit.toggleCheckbox(value??false);
                                  },
                                  activeColor: AppColors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5.r),
                                  ),
                                ),
                              ],
                        ),
                        SizedBox(height: 41.h),
                         CustomButton(
                              text: 'إنشاء حساب',
                              onPressed: () {
                                cubit.onRegister();
                              },
                              textStyle: AppStyles.textStyle14w700FF
                                  .copyWith(color: AppColors.white),
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            MyNavigator.goTo(
                              context,
                              const LoginScreen(),
                              type: NavigatorType.pushReplacement,
                            );
                          },
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'لديك حساب بالفعل؟  ',
                                    style: AppStyles.textStyle14w400FF
                                        .copyWith(color: AppColors.gray2),
                                  ),
                                  TextSpan(
                                    text: 'تسجيل الدخول',
                                    style: AppStyles.textStyle14w400FF
                                        .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
          },
        ),
        );
      },
    );
  }
}
