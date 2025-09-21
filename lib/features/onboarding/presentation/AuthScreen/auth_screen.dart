// File: lib/features/auth/presentation/screens/auth_screen.dart
import 'package:eazy/features/onboarding/presentation/AuthScreen/sign_up_form.dart';
import 'package:flutter/material.dart';

import 'package:eazy/core/widgets/app_logo.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/theme/styles.dart';
import 'login_form.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _screenIndex = 0; // 0 for Login, 1 for Sign Up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [

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
                  const SizedBox(height: 50),

                  _screenIndex == 0 ? const LoginForm() : const SignUpForm(),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _screenIndex = _screenIndex == 0 ? 1 : 0;
                      });
                    },
                    child: Text(
                      _screenIndex == 0
                          ? 'ليس لديك حساب؟ سجل الآن'
                          : 'لديك حساب بالفعل؟ سجل الدخول',
                      style: kBodyTextStyle.copyWith(color: kWhiteColor),
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