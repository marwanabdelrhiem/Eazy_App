import 'package:eazy/features/onboarding/presentation/screens/home/lessons/%20presentation/quiz_result_screen.dart';
import 'package:flutter/material.dart';


class LessonQuizScreen extends StatefulWidget {
  const LessonQuizScreen({super.key});

  @override
  State<LessonQuizScreen> createState() => _LessonQuizScreenState();
}

class _LessonQuizScreenState extends State<LessonQuizScreen> {
  int _currentQuestionIndex = 0;
  int _answeredQuestionsCount = 0;

  final List<Map<String, dynamic>> _quizQuestions = [
    {
      "question": "نص السؤال الأول هنا والذي عادة ما يتكون\nمن عدة اسطر؟",
      "options": ["نص الإجابة 1", "نص الإجابة 2", "نص الإجابة 3"],
      "correctAnswer": "نص الإجابة 2",
      "userAnswer": null,
    },
    {
      "question": "هذا هو نص السؤال الثاني، هل يمكنك الإجابة عليه؟",
      "options": ["نص الإجابة أ", "نص الإجابة ب", "نص الإجابة ج"],
      "correctAnswer": "نص الإجابة أ",
      "userAnswer": null,
    },
    {
      "question": "السؤال الثالث: ما هي الإجابة الصحيحة؟",
      "options": ["إجابة 1", "إجابة 2", "إجابة 3"],
      "correctAnswer": "إجابة 3",
      "userAnswer": null,
    },
    {
      "question": "السؤال الرابع والأخير، نص سؤال أطول؟",
      "options": ["خيار 1", "خيار 2", "خيار 3"],
      "correctAnswer": "خيار 1",
      "userAnswer": null,
    },
  ];

  void _onAnswerSelected(String selectedOption) {
    if (_quizQuestions[_currentQuestionIndex]["userAnswer"] == null) {
      setState(() {
        _quizQuestions[_currentQuestionIndex]["userAnswer"] = selectedOption;
        _answeredQuestionsCount++;
      });
    } else {
      setState(() {
        _quizQuestions[_currentQuestionIndex]["userAnswer"] = selectedOption;
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _quizQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        int correctCount = 0;
        for (var q in _quizQuestions) {
          if (q["userAnswer"] == q["correctAnswer"]) {
            correctCount++;
          }
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultScreen(
              totalQuestions: _quizQuestions.length,
              correctAnswers: correctCount,
              quizQuestions: _quizQuestions,
            ),
          ),
        );
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _quizQuestions[_currentQuestionIndex];
    final totalQuestions = _quizQuestions.length;
    final isLastQuestion = _currentQuestionIndex == totalQuestions - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'اختبار سريع',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pagination
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _previousQuestion,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: _currentQuestionIndex == 0 ? Colors.grey : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),

                  ...List.generate(totalQuestions, (index) {
                    final questionNumber = totalQuestions - index;
                    return Row(
                      children: [
                        _buildPageNumber(
                          questionNumber,
                          isCurrent: index == totalQuestions - 1 - _currentQuestionIndex,
                          isAnswered: _quizQuestions[totalQuestions - 1 - index]["userAnswer"] != null,
                        ),
                        if (index < totalQuestions - 1) const SizedBox(width: 8),
                      ],
                    );
                  }).reversed.toList(),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _nextQuestion,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: _currentQuestionIndex == totalQuestions - 1 ? Colors.grey : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'أنهيت $_answeredQuestionsCount من $totalQuestions',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              // Question Type
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'اختبار متعدد',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.list, color: Color(0xFF2A72AD)),
                ],
              ),
              const SizedBox(height: 20),
              // Question Text
              Text(
                currentQuestion["question"],
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // Answer Options
              ...currentQuestion["options"].map<Widget>((option) {
                return GestureDetector(
                  onTap: () => _onAnswerSelected(option),
                  child: _buildAnswerOption(
                    option,
                    isSelected: option == currentQuestion["userAnswer"],
                  ),
                );
              }).toList(),
              const SizedBox(height: 40),
              // Next button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF2A72AD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    isLastQuestion ? "انتهيت" : "التالي",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageNumber(int number, {required bool isCurrent, required bool isAnswered}) {
    Color borderColor = Colors.grey;
    Color backgroundColor = Colors.transparent;
    Color textColor = Colors.black;

    if (isCurrent) {
      backgroundColor = Colors.orange;
      textColor = Colors.white;
    } else if (isAnswered) {
      backgroundColor = const Color(0XFF2A72AD);
      textColor = Colors.white;
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerOption(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2A72AD) : Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}