import 'package:flutter/material.dart';

class QuizSolutionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> quizQuestions;

  const QuizSolutionsScreen({
    super.key,
    required this.quizQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'النتائج',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          itemCount: quizQuestions.length,
          itemBuilder: (context, index) {
            final question = quizQuestions[index];
            return _buildQuestionCard(question, index + 1);
          },
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Map<String, dynamic> question, int questionNumber) {
    final String questionText = question["question"];
    final List<String> options = List<String>.from(question["options"]);
    final String? userAnswer = question["userAnswer"];
    final String correctAnswer = question["correctAnswer"];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // تم التعديل إلى End
            children: [
              // **هنا تم عكس الترتيب**
              const Icon(Icons.list, color: Color(0xFF2A72AD), size: 18),
              const SizedBox(width: 8),
              const Text(
                'اختبار متعدد',
                style: TextStyle(
                  color: Color(0xFF2A72AD),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            questionText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 20),
          ...options.map((option) {
            return _buildAnswerOption(
              option,
              isCorrect: option == correctAnswer,
              isUserAnswer: option == userAnswer,
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildAnswerOption(String text, {required bool isCorrect, required bool isUserAnswer}) {
    Color backgroundColor;
    Color textColor;

    if (isCorrect) {
      backgroundColor = const Color(0xFF2A72AD);
      textColor = Colors.white;
    } else {
      backgroundColor = const Color(0xFFD32F2F);
      textColor = Colors.white;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: backgroundColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}