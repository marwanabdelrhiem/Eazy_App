import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:eazy_app/features/Lessons/data/models/single_catgory_response.dart';
import 'package:eazy_app/features/Lessons/manager/lesson_cubit/cubit.dart';
import 'package:eazy_app/features/Lessons/manager/lesson_cubit/states.dart';
import 'package:eazy_app/features/Upgrade/views/upgrade_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonsItem extends StatelessWidget {
  const LessonsItem({
    super.key,
    required this.data,
    this.onTap,
  });

  final Lessons data;
  final VoidCallback? onTap;

  Widget buildLessonAction(Lessons data, BuildContext context) {
    if (data.paid == 1) {
      return GestureDetector(
        onTap: () {
          MyNavigator.goTo(context, const UpgradeView(),
              type: NavigatorType.push);
        },
        child: Container(
          alignment: Alignment.center,
          width: 87.w,
          height: 26.55.h,
          decoration: BoxDecoration(
            color: AppColors.iconSave,
            borderRadius: BorderRadius.circular(5.23.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvg(
                path: AppIcons.lock_open,
                color: AppColors.white,
              ),
              SizedBox(width: 4.w),
              Text(
                'اشترك',
                style: AppStyles.textStyle12w400FF.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: 355.w,
        height: 103.h,
        decoration: BoxDecoration(
          color: AppColors.white2,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            BlocBuilder<LessonsCubit, LessonsStates>(
              builder: (context, state) {
                final cubit = LessonsCubit.get(context);
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cubit.toggleSave();
                      },
                      icon: CustomSvg(
                        path: AppIcons.saveIcon,
                        color: AppColors.iconSave,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    buildLessonAction(data, context),
                    const Spacer(),
                    Text(
                      "الدرس ${data.id ?? ''}",
                      style: AppStyles.textStyle12w400FF.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  data.title ?? '',
                  style: AppStyles.textStyle14w700FF,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
