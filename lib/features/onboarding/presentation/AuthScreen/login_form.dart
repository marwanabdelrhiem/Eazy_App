// File: lib/features/auth/presentation/widgets/login_form.dart
import 'package:flutter/material.dart';
import 'package:eazy/core/widgets/custom_button.dart';
import 'package:eazy/core/widgets/custom_text_form_field.dart';
import 'package:eazy/core/routes/app_routes.dart';

import '../../../../core/constants/colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'تسجيل دخول',
          style: TextStyle(

            color: kWhiteColor,
            fontSize: 24,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 20),

        const CustomTextFormField(
          hintText: 'رقم الهاتف / البريد الإلكتروني',
        ),
        const SizedBox(height: 15),

        const CustomTextFormField(
          hintText: 'كلمة المرور',
          isPassword: true,
        ),
        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              // هنا يفتح شاشة "نسيت كلمة المرور"
              Navigator.of(context).pushNamed(AppRoutes.forgetPasswordRoute);
            },
            child: const Text(
              'نسيت كلمة المرور؟',
              style: TextStyle(color: Color(0xFFA4ACAD),fontWeight: FontWeight.bold,wordSpacing: 1),
            ),
          ),
        ),
        const SizedBox(height: 20),


         CustomButton(
          text: 'تسجيل دخول',
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.homeRoute);
          },
          color: kNextButtonColor,
        ),

      ],
    );
  }
}
