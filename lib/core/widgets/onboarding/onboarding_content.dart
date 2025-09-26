// File: lib/core/widgets/onboarding/onboarding_content.dart
import 'package:flutter/material.dart';
import 'package:eazy/core/theme/styles.dart';
import 'package:eazy/core/widgets/onboarding/onboarding_indicators.dart';

class OnboardingContent extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnboardingContent({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 👇 الصورة فوق
        Image.asset(
          'assets/images/Group 227.png',
          width: 329.29,
          height: 330,
        ),

        // 👇 كل اللي تحت الصورة ينزل لتحت
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30), // مسافة تحت الصورة

              OnboardingIndicators(
                count: count,
                currentIndex: currentIndex,
              ),

              const SizedBox(height: 20),

              Text(
                'قم بتمكين تجربة التعلم الخاصة بك',
                style: kHeadlineStyle,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة. لقد تم توليد هذا النص. هذا النص هو مثال لنص يمكن.',
                style: kBodyTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
