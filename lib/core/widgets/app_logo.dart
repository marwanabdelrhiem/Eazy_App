// File: lib/core/widgets/app_logo.dart
import 'package:flutter/material.dart';
import 'package:eazy/core/constants/colors.dart';

class AppLogo extends StatelessWidget {
  final bool isMini; // true = AppBar logo, false = full logo
  final double size;

  const AppLogo({super.key, this.isMini = false, this.size = 40});

  @override
  Widget build(BuildContext context) {
    if (isMini) {
      // نسخة صغيرة (AppBar)
      return Image.asset(
        'assets/images/Eazyblack.png', // تم تغيير المسار إلى الشعار الأسود
        width: size,
        height: size,
        fit: BoxFit.contain,
      );
    }

    // النسخة الكاملة
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Eazy.png', // مسار الشعار الملون
          width: 291,
          height: 172,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        const Text(
          '!مدرسة في جيبك',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}