import 'package:eazy_app/core/tools//my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:eazy_app/features/Upgrade/views/widgets/feature_description.dart';
import 'package:eazy_app/features/Upgrade/views/widgets/salary_widget.dart';
import 'package:eazy_app/features/Upgrade/views/widgets/stack_widget.dart';
import 'package:eazy_app/features/subscripition/views/subscripition_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpgradeView extends StatelessWidget {
  const UpgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
          SizedBox(width: double.infinity, height: 310.h, child: StackWidget()),
          Padding(
            padding: AppPaddings.mainPadding,
            child: Container(
              width: double.infinity,
              height: 470.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 15.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r),
                      ),
                      color: AppColors.colorUpgrade,
                    ),
                  ),
                  SizedBox(height: 37.h),
                  Center(
                    child: Text(
                      'اشتراك اسبوعي',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Container(
                    padding: EdgeInsets.only(right: 20.w),
                    width: 307.w,
                    child: Text(
                      'وصف خطة الاشتراك هنا والذي عادة ما يكون من عدة اسطر وصف خطة الاشتراك هنا والذي عادة ما يكون من عدة اسطر',
                      textAlign: TextAlign.end,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                        height: 2.2.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  const FeatureDescription(),
                  SizedBox(height: 20.h),
                  const FeatureDescription(),
                  SizedBox(height: 37.h),
                  const SalaryWidget(),
                  SizedBox(height: 29.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.w),
                    child: CustomBtn(
                      text: 'اشتراك',
                      onPressed: () {
                        MyNavigator.goTo(
                          context,
                          const SubscripitionView(),
                          type: NavigatorType.push,
                        );
                      },
                      width: double.infinity,
                      height: 54.h,
                      colorbut: const Color(0xFFF5E6D3),
                      textcolor: AppColors.colorUpgrade,
                      icon: CustomSvg(path: AppIcons.crownIcon),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
