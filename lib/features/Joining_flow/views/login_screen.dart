import 'package:eazy_app/core/helper/app_validators.dart';
import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/CustomSvg.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/textField.dart';
import 'package:eazy_app/features/Joining_flow/views/sign_up_screen.dart';
import 'package:eazy_app/features/home/views/home_view.dart';
import 'package:eazy_app/features/splash&onboarding/widgets/text_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/app_pop_up.dart';
import '../../../core/utils/appIcons.dart';
import '../../splash&onboarding/background.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../manager/login_cubit/login_states.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return BlocProvider(
           create: (context) => LoginCubit(),
            child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                MyNavigator.goTo(
                    context, HomeView(),
                    type: NavigatorType.pushAndRemoveUntil);
              }
              else if (state is LoginError) {
                AppPopUp.showToast(state.error, AppColors.red);
              }

              },
             builder: (context, state) {
              LoginCubit cubit = LoginCubit.get(context);
              return Stack(
            children: [
               SplashBackgroundWidget(),
              Padding(
                padding: AppPaddings.mainPadding,
                child: SingleChildScrollView(
                  child: Form(
                    key:cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 90.h,),
                        Center(child: TextSplash()),
                        SizedBox(height: 90.h),
                        Text(
                          'تسجيل دخول',
                          style: AppStyles.textStyle18w700.copyWith(color: AppColors.white),
                        ),
                        SizedBox(height: 15.h),
                        CustomTextField(
                          hintText: 'رقم الهاتف / البريد الإلكتروني',
                          controller: cubit.email_phoneController,
                          backgroundColor: AppColors.white,
                          validator: AppValidator.requiredValidator,
                        ),
                        SizedBox(height: 16.h),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return CustomTextField(
                              hintText: 'كلمة المرور',
                              controller: cubit.passwordController,
                              obscureText: cubit.isPassword,
                              prefixIcon: IconButton(onPressed: (){
                                cubit.changePasswordVisibility();
                              }, icon: CustomSvg(
                                path: cubit.isPassword?AppIcons.eyeOn:AppIcons.eyeOff,
                                color: AppColors.gray,
                                width: 20.w,
                                height: 20.h,
                              )),
                            validator: AppValidator.passwordValidator,
                            );
                          },
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            SizedBox(width: 27.w),
                            GestureDetector(
                              onTap: () {
                                MyNavigator.goTo(
                                  context,
                                  const ForgetPassword(),
                                  type: NavigatorType.push,
                                );
                              },
                              child: Text(
                                'نسيت كلمة المرور؟',
                                style: AppStyles.textStyle14w700FF.copyWith(color: AppColors.gray),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 109.h),
                        CustomBtn(
                          width: double.infinity,
                          height: 48.h,
                          text: 'تسجيل دخول',
                          onPressed: () {
                            cubit.onlogin(context);
                          },
                        ),

                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            MyNavigator.goTo(
                              context,
                              const SignUpScreen(),
                              type: NavigatorType.push,
                            );
                          },
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'ليس لديك حساب؟ ',
                                    style: AppStyles.textStyle14w400FF.copyWith(
                                      color: AppColors.gray2,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'سجل الآن',
                                    style: AppStyles.textStyle14w400FF.copyWith(
                                      color: AppColors.white,
                                    ),
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
        ),
);
      },
    );
  }
}
