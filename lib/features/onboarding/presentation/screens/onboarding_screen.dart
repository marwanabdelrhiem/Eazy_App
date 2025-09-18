// File: lib/features/onboarding/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';

import 'package:eazy/core/theme/styles.dart';
import 'package:eazy/core/widgets/custom_button.dart';
import 'package:eazy/core/widgets/onboarding/onboarding_content.dart';
import 'package:eazy/core/widgets/onboarding/onboarding_indicators.dart';
import 'package:eazy/core/routes/app_routes.dart';

import '../../../../core/constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _pageCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnboardingContent(),
                  OnboardingContent(),
                  OnboardingContent(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 40),
              child: Column(
                children: [
                  OnboardingIndicators(
                    count: _pageCount,
                    currentIndex: _currentPage,
                  ),
                  const SizedBox(height: 30),
                  if (_currentPage == _pageCount - 1)
                    CustomButton(
                      text: 'ابدأ',
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(AppRoutes.authRoute);
                      },
                      color: kSecondaryColor,
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(_pageCount - 1);
                          },
                          child: Text(
                            'تخطي',
                            style: kBodyTextStyle.copyWith(color: kBlackColor.withOpacity(0.5)),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: CustomButton(
                            text: 'التالي',
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            color: kNextButtonColor,
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}