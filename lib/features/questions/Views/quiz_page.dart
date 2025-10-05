import 'package:eazy_app/core/helper/my_navgator.dart';
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/utils/appStyles.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:eazy_app/core/widgets/customButtom.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:eazy_app/features/Lessonsdetails/views/Lessons_details_view.dart';
import 'package:eazy_app/features/questions/Views/widgets/question_navigator_bar.dart';
import 'package:eazy_app/features/result/views/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Lessonsdetails/data/model/singel_lesson_response.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.questions,
    required this.lessonId,
    required this.catgoryId,
  });

  final List<Questions> questions;
  final int lessonId;
  final int catgoryId;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int correctAnswers = 0;
  List<int?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.questions.length, null);
  }

  void _nextQuestion() {
    if (_currentPage < widget.questions.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevQuestion() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: widget.questions.isEmpty
            ? Center(
          child: Text(
            'لا يوجد أسئلة',
            style: AppStyles.textStyle18w400.copyWith(color: AppColors.gray),
          ),
        )
            : Column(
          children: [
            // AppBar
            _currentPage == 0
                ? CustomAppBar(
              title: 'اختبار سريع',
              onPressed: () {
                Navigator.of(context).pop();
                MyNavigator.goTo(
                  context,
                  LessonsDetailsView(
                    catgoryId: widget.catgoryId,
                    lessonId: widget.lessonId,
                  ),
                  type: NavigatorType.pushReplacement,
                );
              },
            )
                : Padding(
              padding: EdgeInsets.only(top: 68.h),
              child: Center(
                child: Text('اختبار سريع', style: AppStyles.textStyle18w400),
              ),
            ),

            SizedBox(height: 20.h),

            // الشريط العلوي للتنقل بين الأسئلة
            QuestionNavigatorBar(
              currentPage: _currentPage,
              totalQuestions: widget.questions.length,
              onNext: _nextQuestion,
              onPrevious: _prevQuestion,
            ),

            SizedBox(height: 20.h),

            // الأسئلة
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  final question = widget.questions[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              CustomSvg(
                                path: AppIcons.multiplechoice,
                                height: 20.h,
                                width: 20.w,
                                color: AppColors.blue,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'اختيار متعدد',
                                style: AppStyles.textStyle14w400C
                                    .copyWith(color: AppColors.blue),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),

                        // نص السؤال
                        Text(
                          question.title ?? '',
                          style: AppStyles.textStyle20w400FF,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(height: 24.h),

                        // قائمة الإجابات
                        ...List.generate(question.answers!.length, (answerIndex) {
                          final answer = question.answers![answerIndex];
                          final isSelected = selectedAnswers[index] == answerIndex;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                // لو السؤال لسه متجاوبش
                                if (selectedAnswers[index] == null) {
                                  selectedAnswers[index] = answerIndex;
                                  if (answer.isCorrect == 1) {
                                    correctAnswers++;
                                  }
                                } else {
                                  // لو غير الاختيار السابق، نحدث العداد لو لزم الأمر
                                  final prevAnswer = question
                                      .answers![selectedAnswers[index]!];
                                  if (prevAnswer.isCorrect == 1 &&
                                      answer.isCorrect == 0) {
                                    correctAnswers--;
                                  } else if (prevAnswer.isCorrect == 0 &&
                                      answer.isCorrect == 1) {
                                    correctAnswers++;
                                  }
                                  selectedAnswers[index] = answerIndex;
                                }
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(bottom: 18.w),
                              padding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.blue
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(11.r),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.blue
                                      : AppColors.gray.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                answer.title ?? '',
                                textDirection: TextDirection.rtl,
                                style: AppStyles.textStyle14w400FF.copyWith(
                                  color:
                                  isSelected ? Colors.white : Colors.black,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),

            // الزر السفلي
            CustomBtn(
              text: _currentPage == widget.questions.length - 1
                  ? 'إنهاء'
                  : 'التالي',
              onPressed: () {
                if (_currentPage == widget.questions.length - 1) {
                  MyNavigator.goTo(
                    context,
                    ResultView(
                      questions: widget.questions,
                      lessonId: widget.lessonId,
                      catgoryId: widget.catgoryId,
                      correctAnswers: correctAnswers,
                      totalQuestions: widget.questions.length,
                    ),
                    type: NavigatorType.pushReplacement,
                  );
                } else {
                  _nextQuestion();
                }
              },
              width: double.infinity,
              height: 51.h,
            ),
            SizedBox(height: 44.h),
          ],
        ),
      ),
    );
  }
}

