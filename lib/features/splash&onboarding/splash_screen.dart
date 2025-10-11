import 'package:eazy_app/core/tools//my_navgator.dart';
import 'package:eazy_app/features/home/views/home_view.dart';
import 'package:eazy_app/features/splash&onboarding/widgets/text_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'background.dart';
import 'onboarding1_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (!mounted) return;

    if (accessToken != null && accessToken.isNotEmpty) {
      MyNavigator.goTo(
        context,
        const HomeView(),
        type: NavigatorType.pushAndRemoveUntil,
      );
    } else {
      MyNavigator.goTo(
        context,
        const OnBoarding1(),
        type: NavigatorType.pushAndRemoveUntil,
      );
    }
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
