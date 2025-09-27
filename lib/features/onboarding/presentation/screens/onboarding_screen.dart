// File: lib/features/onboarding/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';

import 'package:eazy/core/theme/styles.dart';
import 'package:eazy/core/widgets/custom_button.dart';
import 'package:eazy/core/widgets/onboarding/onboarding_content.dart';
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

    final double buttonWidth = MediaQuery.of(context).size.width * 0.6;

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
                children: List.generate(
                  _pageCount,
                      (index) => OnboardingContent(
                    currentIndex: _currentPage,
                    count: _pageCount,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 25),
              child: Column(
                children: [
                  if (_currentPage == _pageCount - 1)
                    SizedBox(
                      width: 340,
                      height: 51,
                      child: CustomButton(
                        text: 'ابدأ',
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(AppRoutes.authRoute);
                        },
                        color: kSecondaryColor,
                      ),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 231,
                          height: 57,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: CustomButton(
                                  text: 'التالي',
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  color: kNextButtonColor,
                                ),
                              ),
                              const Positioned(
                                left: 0,
                                top: 0,
                                bottom: 0,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 69),

                        Container(
                          width: 70,
                          height: 40,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                ),
                                onPressed: () {
                                  _pageController.jumpToPage(_pageCount - 1);
                                },
                                child: Text(
                                  'تخطي',
                                  style: kBodyTextStyle.copyWith(
                                    fontSize: 18,
                                    color: kBlackColor.withOpacity(0.4),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
