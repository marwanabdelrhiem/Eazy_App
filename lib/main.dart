// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:eazy/core/routes/app_routes.dart';
import 'package:eazy/core/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eazy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kWhiteColor,
        fontFamily: 'Cairo', // لو عندك خط مخصص
      ),
      initialRoute: AppRoutes.splashRoute, // أول شاشة تفتح
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
