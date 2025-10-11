import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/features/Lessons/manager/lesson_cubit/cubit.dart';
import 'package:eazy_app/features/Lessons/manager/lesson_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsCubit, LessonsStates>(
      builder: (context, state) {
        bool expand = false;
        if (state is LessonsExpand) {
          expand = state.expand;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: HtmlWidget(
                text, // هنا تمرر النص اللي جاي لك
                textStyle: AppStyles.textStyle14w400.copyWith(
                  color: AppColors.gray,
                  height: 1.7.h,
                ),
                renderMode: RenderMode.column, // لتجنب مشاكل overflow
                enableCaching: true,
                // لو عايز تحدد سطور
                customStylesBuilder: (element) {
                  return {
                    'max-lines': expand ? 'none' : '3',
                    'text-overflow': expand ? 'clip' : 'ellipsis',
                  };
                },
              ),
            ),
            InkWell(
              onTap: () => LessonsCubit.get(context).toggleExpand(),
              child: Text(
                expand ? "إقرأ أقل" : "  المزيد... ",
                style: AppStyles.textStyle14w400.copyWith(
                  color: AppColors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
