import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionNavigatorBar extends StatelessWidget {
  final int currentPage;
  final int totalQuestions;
  final Function() onNext;
  final Function() onPrevious;
  final Function(int)? onJumpTo;

  const QuestionNavigatorBar({
    super.key,
    required this.currentPage,
    required this.totalQuestions,
    required this.onNext,
    required this.onPrevious,
    this.onJumpTo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            IconButton(
              onPressed: currentPage > 0 ? onPrevious : null,
              icon: CustomSvg(
                width: 24.w,
                height: 24.h,
                color: currentPage > 0 ? AppColors.black : AppColors.gray,
                path: AppIcons.arrow_frowerd,
              ),
            ),

            // أزرار التنقل بين الأسئلة
            ...List.generate(totalQuestions, (index) {
              final isActive = index == currentPage;
              return GestureDetector(
                onTap: () => onJumpTo?.call(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 33.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.orange : AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}', // يبدأ من 1 بدل 0
                      style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                          color: isActive ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),

            IconButton(
              onPressed: currentPage < totalQuestions - 1 ? onNext : null,
              icon: CustomSvg(
                width: 24.w,
                height: 24.h,
                path: AppIcons.arrowBack,
                color: currentPage < totalQuestions - 1
                    ? AppColors.black
                    : AppColors.gray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // النص السفلي "أنهيت..."
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            'أنهيت ${currentPage + 1} من $totalQuestions',
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
