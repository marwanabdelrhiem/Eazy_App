
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appImages.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:eazy_app/features/Lessons/Views/widgets/image_Start_widget.dart';
import 'package:eazy_app/features/Lessonsdetails/data/model/singel_lesson_response.dart';
import 'package:eazy_app/features/Lessonsdetails/views/widgets/reminder_item.dart';
import 'package:eazy_app/features/Lessonsdetails/views/widgets/build_paragraphs.dart';
import 'package:eazy_app/features/Lessonsdetails/views/widgets/product_card.dart';
import 'package:eazy_app/features/Lessonsdetails/views/widgets/app_dialog.dart';
import 'package:eazy_app/features/questions/Views/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/tools/my_navgator.dart';
import '../manager/singel_lesson_cubit/singel_lesson_cubit.dart';
import '../manager/singel_lesson_cubit/singel_lesson_state.dart';

class SingleLessonView extends StatefulWidget {
  const SingleLessonView ({
    super.key,
    this.showSheetOnOpen,
    required this.lessonId,
    required this.catgoryId,
  });

  final bool? showSheetOnOpen;
  final int lessonId;
  final int catgoryId;

  @override
  State<SingleLessonView > createState() => _LessonsDetailsViewState();
}

class _LessonsDetailsViewState extends State<SingleLessonView > {
  final List<String> explanationParagraphs = [
    'قبل الشرح لازم نعرف حروف العلة أو الحروف المتحركة وهى (A-E-I-O-U). تأتي قبل الأسماء المفردة المعدودة، وقبل الوظيفة أو مجموعة معينة من الناس أو الجنسية.',
    'a مع الأرقام التي تعني "كل" مثل: a day.',
    'ولا نستخدم a أو an مع الأسماء المعنوية، وأسماء المعادن، وقبل الجمع أو الأسماء غير المعدودة.',
    'an أداة للنكرة التي تبدأ بحرف علة (A-E-I-O-U).',
    'a أداة للنكرة التي لا تبدأ بأحد حروف العلة أو الحروف المتحركة.',
    'نستخدم a قبل اسم مفرد معدود يبدأ بحرف ساكن.',
  ];

  final List<String> examples = [
    'إنها هدية. It\'s a present.',
    'إنه يوم جميل. It\'s a lovely day.',
    'هل أنت طبيب؟ Are you a doctor?',
    'أنا عندي بنت وولدين. I have got a daughter and two sons.',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.showSheetOnOpen == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => const AppDialog(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      SingelLessonCubit()..getHomeData(id: widget.lessonId),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: AppPaddings.mainPadding,
          child: SingleChildScrollView(
            child: BlocBuilder<SingelLessonCubit, SingelLessonState>(
              builder: (context, state) {
                if (state is SingelLessonLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SingelLessonSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomAppBar(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.r),
                              ),
                            ),
                            builder: (_) => const AppDialog(),
                          );
                        },
                      ),
                      SizedBox(height: 13.h),
                      ImageStartWidget(
                        image: state.data.data!.title!,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSvg(
                            path: AppIcons.saveIcon,
                            width: 20.4.w,
                            height: 23.h,
                            color: AppColors.gray,
                          ),
                          Expanded(
                            child: Text(
                              state.data.data!.title!,
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.cairo(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'وصف الدرس',
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 9.h),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: HtmlWidget(
                          state.data.data!.content!,
                          textStyle: GoogleFonts.cairo(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray,
                            height: 1.7,
                          ),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Text(
                        'شرح الفرق بين a و an و the بالتفصيل',
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 16.h),
                      BuildParagraphs(paragraphs: explanationParagraphs),
                      SizedBox(height: 11.h),
                      Text(
                        'أمثلة :',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffF28D1C),
                        ),
                      ),
                      ...examples.map((e) => ProductCard(text: e)),
                      SizedBox(height: 16.h),
                      ReminderItem(
                        title: 'انتبه',
                        content:
                        'لا نستخدم a قبل الاسم الجمع وكذلك قبل الأسماء غير معدودة. نستخدم an قبل اسم مفرد معدود يبدأ بحرف متحرك.',
                      ),
                      SizedBox(height: 35.h),
                      Container(
                        width: double.infinity,
                        height: 215.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          borderRadius: BorderRadius.circular(14.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Appimages.alarmImage),
                          ),
                        ),
                      ),
                      SizedBox(height: 51.h),
                      CustomBtn(
                        text: 'انهي الدرس',
                        onPressed: () {
                          MyNavigator.goTo(
                            context,
                            QuizPage(
                              catgoryId: widget.catgoryId,
                              questions: state.data.data!.questions!,
                              lessonId: widget.lessonId,
                            ),
                            type: NavigatorType.push,
                          );
                        },
                        width: double.infinity,
                        height: 51.h,
                      ),
                      SizedBox(height: 50.h),
                    ],
                  );
                } else if (state is SingelLessonError) {
                  return Center(
                    child: Text(
                      state.error,
                      style: GoogleFonts.cairo(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}