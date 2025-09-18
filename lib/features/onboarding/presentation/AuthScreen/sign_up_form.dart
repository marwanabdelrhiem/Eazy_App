// File: lib/features/auth/presentation/widgets/signup_form.dart
import 'package:flutter/material.dart';
import 'package:eazy/core/widgets/custom_button.dart';

import 'package:eazy/core/widgets/custom_text_form_field.dart';

import '../../../../core/constants/colors.dart'; // استيراد الـ widget الجديدة

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'تسجيل حساب جديد',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 20),

        const CustomTextFormField(
          hintText: 'اسم المستخدم',
        ),
        const SizedBox(height: 15),

        const CustomTextFormField(
          hintText: 'رقم الهاتف / البريد الإلكتروني',
        ),
        const SizedBox(height: 15),

        const CustomTextFormField(
          hintText: 'كلمة المرور',
          isPassword: true,
        ),
        const SizedBox(height: 15),

        const CustomTextFormField(
          hintText: 'أعد إدخال كلمة المرور',
          isPassword: true,
        ),
        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'أوافق على الشروط والأحكام',
              style: TextStyle(color: kWhiteColor),
            ),
            Checkbox(
              value: false,
              onChanged: (bool? value) {},
              activeColor: kWhiteColor,
              checkColor: kPrimaryColor,
            ),
          ],
        ),
        const SizedBox(height: 20),

        CustomButton(
          text: 'إنشاء الحساب',
          onPressed: () {},
        ),
      ],
    );
  }
}