import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appPaddings.dart';
import 'package:eazy_app/core/widgets/customAppBar.dart';
import 'package:eazy_app/features/Lessonsdetails/data/model/singel_lesson_response.dart';
import 'package:eazy_app/features/result/views/widgets/continer_result.dart';
import 'package:eazy_app/features/view_result/views/widgets/item_answer_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewResult extends StatelessWidget {
  const ViewResult({super.key, required this.questions});

  final List<Questions> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: AppPaddings.mainPadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(title: 'النتائج'),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  questions.length,
                      (index) => ContinerResult(text: (index + 1).toString()),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),
            ItemAnswerListview(questions: questions),
          ],
        ),
      ),
    );
  }
}
