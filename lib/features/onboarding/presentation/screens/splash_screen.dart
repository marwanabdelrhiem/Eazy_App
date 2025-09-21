import 'package:flutter/material.dart';

import 'package:eazy/core/widgets/app_logo.dart';
import 'package:eazy/features/onboarding/presentation/screens/onboarding_screen.dart';

import '../../../../core/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoAndTextOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _logoAndTextOpacity = 1.0;
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backgruynd.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: kBlackColor.withOpacity(0.6),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _logoAndTextOpacity,
              duration: const Duration(seconds: 1),
              child: const AppLogo(),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kWhiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}