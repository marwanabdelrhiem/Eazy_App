import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:eazy_app/features/Lessons/Views/Lessons_View.dart';
import 'package:eazy_app/features/result/views/widgets/continer_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Lessonsdetails/data/model/singel_lesson_response.dart';
import '../../view_result/views/views_result.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    super.key,
    required this.lessonId,
    required this.catgoryId,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.questions,
  });

  final int lessonId;
  final int catgoryId;
  final int correctAnswers;
  final int totalQuestions;

  /// ✅ خليها من نوع List<Questions>
  final List<Questions> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    MyNavigator.goTo(
                      context,
                      LessonsView(id: catgoryId),
                      type: NavigatorType.pushReplacement,
                    );
                  },
                  icon: CustomSvg(
                    path: AppIcons.close,
                    color: AppColors.gray,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),

            CustomSvg(path: AppIcons.success),

            Text('نتيجة الاختبار', style: AppStyles.textStyle18w700),

            // Result container
            Container(
              width: double.infinity,
              height: 231.h,
              decoration: BoxDecoration(
                color: const Color(0x122A72AD),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 25.h),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '$correctAnswers/',
                        style: AppStyles.textStyle12_54w400FF.copyWith(
                          fontSize: 50.sp,
                          color: AppColors.blue,
                        ),
                        children: [
                          TextSpan(
                            text: '$totalQuestions',
                            style: AppStyles.textStyle12_54w400FF.copyWith(
                              fontSize: 50.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        totalQuestions,
                            (index) => ContinerResult(
                          text: (index + 1).toString(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26.h),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  '$totalQuestions أسئلة',
                                  style: AppStyles.textStyle14w400C,
                                ),
                                Text(
                                  '5 دقائق',
                                  style: AppStyles.textStyle14w400C.copyWith(
                                    color: AppColors.gray,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                MyNavigator.goTo(
                                  context,
                                  ViewResult(questions: questions),
                                  type: NavigatorType.push,
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 28.w,
                                    height: 28.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.orange,
                                    ),
                                    child: CustomSvg(
                                      path: AppIcons.eyeOn,
                                      width: 17.w,
                                      height: 17.h,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'عرض الحلول',
                                    style: AppStyles.textStyle14w400C.copyWith(
                                      color: AppColors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            CustomBtn(
              text: 'انتقل للدرس التالي',
              onPressed: () {
                MyNavigator.goTo(
                  context,
                  LessonsView(id: catgoryId),
                  type: NavigatorType.pushReplacement,
                );
              },
              width: double.infinity,
              height: 51.h,
            ),
          ],
        ),
      ),
    );
  }
}
