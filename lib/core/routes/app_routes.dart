// File: lib/core/routes/app_routes.dart

import 'package:flutter/material.dart';

// ==== Auth Screens ====
import '../../features/onboarding/presentation/AuthScreen/auth_screen.dart';
import '../../features/onboarding/presentation/AuthScreen/otp_screen.dart';
import '../../features/onboarding/presentation/AuthScreen/forget_password_screen.dart';
import '../../features/onboarding/presentation/AuthScreen/otp_to_update_password_screen.dart';
import '../../features/onboarding/presentation/AuthScreen/update_password_screen.dart';

// ==== Account & Home Screens ====
import '../../features/onboarding/presentation/screens/home/account/presentation/screens/account_created_screen.dart';
import '../../features/onboarding/presentation/screens/home/account/presentation/screens/profile_screen.dart';
import '../../features/onboarding/presentation/screens/home/lessons/ presentation/my_lessons_screen.dart';
import '../../features/onboarding/presentation/screens/home/main_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/screens/splash_screen.dart';

// ==== Lessons Screen ====


class AppRoutes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String authRoute = '/auth';
  static const String otpRoute = '/otp';
  static const String profileRoute = '/profile';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String otpToUpdatePasswordRoute = '/otpToUpdatePassword';
  static const String updatePasswordRoute = '/updatePassword';
  static const String homeRoute = '/home';
  static const String accountCreatedRoute = '/accountCreated';

  // 👇 route جديدة
  static const String myLessonsRoute = '/myLessons';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case authRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());

      case otpRoute:
        final args = settings.arguments as Map<String, String>? ?? {};
        return MaterialPageRoute(
          builder: (_) => OtpScreen(
            title: args['title'] ?? "أدخل الكود",
            subtitle: args['subtitle'] ?? "أرسلنا لك رمز تحقق على رقمك",
          ),
        );

      case profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case otpToUpdatePasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const OtpToUpdatePasswordScreen(),
        );

      case homeRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case accountCreatedRoute:
        return MaterialPageRoute(builder: (_) => const AccountCreatedScreen());

    // 👇 شاشة دروسي
      case myLessonsRoute:
        return MaterialPageRoute(builder: (_) => const MyLessonsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Route not found!'),
            ),
          ),
        );
    }
  }
}
