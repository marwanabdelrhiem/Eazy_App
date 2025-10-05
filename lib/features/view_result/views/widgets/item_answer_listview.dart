import 'package:eazy_app/features/Lessonsdetails/data/model/singel_lesson_response.dart';
import 'package:eazy_app/features/view_result/views/widgets/item_answer.dart';
import 'package:flutter/material.dart';

class ItemAnswerListview extends StatelessWidget {
  const ItemAnswerListview({super.key, required this.questions});

  final List<Questions> questions;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return ItemAnswer(model: questions[index]);
      },
      itemCount: questions.length,
    );
  }
}
