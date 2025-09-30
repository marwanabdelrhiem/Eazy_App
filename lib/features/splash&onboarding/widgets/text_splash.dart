import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextSplash extends StatelessWidget {
  const TextSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 114.67.sp, fontFamily: "FingerPaint"),
            children: [
              TextSpan(text: "E", style: TextStyle(color: Colors.blue)),
              TextSpan(text: "a", style: TextStyle(color: Colors.white)),
              TextSpan(text: "z", style: TextStyle(color: Colors.blue)),
              TextSpan(text: "y", style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
        Text(
          '!مدرسة في جيبك',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: "Cairo",
          ),
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}
