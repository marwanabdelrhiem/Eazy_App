import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/features/splash&onboarding/widgets/text_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../home/views/home_view.dart';
import 'background.dart';
import 'onboarding1_screen.dart';
import 'onboardingpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.AccessToken});
  final AccessToken;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoonbording();
  }
  gotoonbording() {
    Future.delayed(Duration(milliseconds: 2000), () {
      if (!mounted) return;
      if (widget.AccessToken != null) {
        MyNavigator.goTo(
            context, HomeView(
        ), type: NavigatorType.pushAndRemoveUntil);
      } else {
        MyNavigator.goTo(
            context, OnBoarding1(),
            type: NavigatorType.pushAndRemoveUntil);
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashBackgroundWidget(),
          Center(child: TextSplash()),
          Positioned(
            top: 750.h,
            left: 183.w,
            width: 27.w,
            height: 27.h,
            child: const SpinKitFadingCircle(
              color: Colors.white,
              size: 27.0,
            ),
          ),
        ],
      ),
    );
  }
}
