import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/features/Lessons/Views/widgets/description_widget.dart';
import 'package:eazy_app/features/Lessons/Views/widgets/image_Start_widget.dart';
import 'package:eazy_app/features/Lessons/Views/widgets/lessons_item.dart';
import 'package:eazy_app/features/Lessons/manager/lesson_cubit/cubit.dart';
import 'package:eazy_app/features/Lessons/manager/singel_catgory_cubit/singel_catgory_states.dart';
import 'package:eazy_app/features/Lessonsdetails/views/Lessons_details_view.dart';
import 'package:eazy_app/features/Upgrade/views/upgrade_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../manager/singel_catgory_cubit/singel_catgory_cubit.dart';

class LessonsView extends StatefulWidget {
  const LessonsView({super.key, required this.id});

  final int id;

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  int selectedLessonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LessonsCubit(),
        ),
        BlocProvider(
          create: (context) => SingelCatgoryCubit()..getHomeData(id: widget.id),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocBuilder<SingelCatgoryCubit, SingelCatgoryStates>(
          builder: (context, state) {
            if (state is SingelCatgoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SingelCatgorySuccess) {
              final lessons = state.singelCatgoryResponse.data?.lessons ?? [];

              return Padding(
                padding: AppPaddings.mainPadding,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomAppBar(
                            onPressed: () {
                              MyNavigator.goBack(context);
                            },
                          ),
                          SizedBox(height: 13.h),
                          ImageStartWidget(
                            image: state.singelCatgoryResponse.data!.image!,
                            Buttom: Positioned(
                              top: 151.h,
                              left: 32.w,
                              child:CustomBtn(
                                text: lessons.isEmpty
                                    ? "لا يوجد دروس"
                                    : "ابدأ الدرس ${lessons[selectedLessonIndex].id}", // ← من API
                                onPressed: () {
                                  if (lessons.isEmpty) return;
                                  MyNavigator.goTo(
                                    context,
                                    LessonsDetailsView(
                                      catgoryId: lessons[selectedLessonIndex].categoryId!,
                                      lessonId: lessons[selectedLessonIndex].id!,
                                    ),
                                    type: NavigatorType.push,
                                  );
                                },
                                width: 291.w,
                                height: 52.h,
                              ),

                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text('القواعد', style: AppStyles.textStyle18w700),
                          SizedBox(height: 16.h),
                          Text('الوصف', style: AppStyles.textStyle16w700T),
                          SizedBox(height: 9.h),
                          if (lessons.isNotEmpty)
                            DescriptionWidget(
                              text: lessons[selectedLessonIndex].content ?? '',
                            )
                          else
                            Text(
                              "لا يوجد وصف متاح",
                              style: AppStyles.textStyle14w700FF.copyWith(
                                color: AppColors.gray,
                              ),
                            ),
                          SizedBox(height: 16.h),
                          Divider(color: AppColors.gray, thickness: 1.h),
                          SizedBox(height: 9.h),
                          Text('الدروس', style: AppStyles.textStyle18w700),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                    if (lessons.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            "لا يوجد دروس",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray,
                            ),
                          ),
                        ),
                      )
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: LessonsItem(
                                data: lessons[index],
                                onTap: () {
                                  if (lessons[index].paid == 1) {
                                      MyNavigator.goTo(context, UpgradeView(),
                                          type: NavigatorType.push
                                    );
                                  } else {
                                    setState(() {
                                      selectedLessonIndex = index;
                                    });
                                  }
                                },
                              ),
                            );
                          },
                          childCount: lessons.length,
                        ),
                      ),
                    SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                  ],
                ),
              );
            } else if (state is SingelCatgoryError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
