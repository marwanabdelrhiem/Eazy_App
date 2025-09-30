import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/my_navgator.dart';
import '../../../core/utils/appColor.dart';
import '../../../core/utils/appStyles.dart';
import '../../Joining_flow/views/login_screen.dart';

class LogoutDialog {
  static Future<void> show(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isDismissible: false, // ما يتقفلش بالضغط برا
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 240.h,
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.h),
              // العنوان
              Text(
                "تسجيل الخروج",
                style: AppStyles.textStyle18w700.copyWith(
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 12.h),
              // النص الوصفي
              Text(
                "هل ترغب بتسجيل الخروج؟",
                style: AppStyles.textStyle16w400.copyWith(
                  color: AppColors.gray,
                ),
              ),
              SizedBox(height: 27.h),
              // الأزرار
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // زر التراجع
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // يقفل الـ bottom sheet
                      },
                      child: Container(
                        height: 57.h,
                        decoration: BoxDecoration(
                          color: AppColors.bottomback,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            "تراجع",
                            style: AppStyles.textStyle14w700FF.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 23.w),
                  // زر نعم
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        MyNavigator.goTo(
                          context,
                          const LoginScreen(),
                          type: NavigatorType.pushReplacement,
                        );
                      },
                      child: Container(
                        height: 57.h,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            "نعم",
                            style: AppStyles.textStyle14w700FF.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
