import 'package:eazy_app/core/utils/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SalaryWidget extends StatelessWidget {
  const SalaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // لتثبيت النصوص في خط واحد
        children: [
          Row(
            children: [
              Text(
                '79 د.ل',
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.red,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.red,
                  decorationThickness: 2,
                  height: 1.2, // لضبط التمركز العمودي
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                '70 د.ل',
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  height: 1.2,
                ),
              ),
            ],
          ),
          Text(
            'السعر',
            style: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
