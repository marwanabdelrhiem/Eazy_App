import 'package:eazy_app/core/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  // Regular weights
  static TextStyle textStyle12w400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle12w400FF = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.firstQus,
  );

  static TextStyle textStyle12w400LS = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    letterSpacing: 1,
  );

  static TextStyle textStyle14w400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle14w400FF = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.firstQus,
  );

  static TextStyle textStyle14w400C = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle14w700 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle textStyle16w400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle16w700 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle textStyle18w400 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle18w700 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle textStyle20w400 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle23w400 = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle26w400 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle35w400 = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle50w400 = TextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle textStyle13_19w400 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    height: 1.5,
  );

  // Custom reusable styles
  static TextStyle textStyle12w400C({
    Color color = AppColors.black,
    double height = 1.5,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textStyle28_58w400({Color color = AppColors.black}) {
    return TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      color: color,
      height: 1.58,
    );
  }
}