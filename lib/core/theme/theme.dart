// File: lib/core/theme/theme.dart
import 'package:flutter/material.dart';

import '../constants/colors.dart';


final kAppTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kWhiteColor,
  fontFamily: kFontFamily,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: kBlackColor),
    bodyMedium: TextStyle(color: kBlackColor),

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    labelStyle: TextStyle(color: Colors.grey),
  ),
);