// File: lib/features/onboarding/presentation/AuthScreen/forget_password_screen.dart

import 'package:flutter/material.dart';
import 'package:eazy/core/constants/colors.dart';
import 'package:eazy/core/theme/styles.dart';
import 'package:eazy/core/widgets/app_logo.dart';
import 'package:eazy/core/routes/app_routes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgruynd.png',
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(),
                  const SizedBox(height: 40),

                  // الفورم داخل Card أبيض
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'نسيت كلمة المرور',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'أدخل رقم هاتفك / البريد الإلكتروني لاستعادة كلمة المرور',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: kMediumGrayColor,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Input field
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'رقم الهاتف / البريد الإلكتروني',
                            filled: true,
                            fillColor: kLightGrayColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                          ),
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 30),

                        // Confirm button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.otpToUpdatePasswordRoute);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'تأكيد',
                            style: TextStyle(fontSize: 18, color: kWhiteColor),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Back to login
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'رجوع لتسجيل الدخول',
                            style: kBodyTextStyle.copyWith(color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
