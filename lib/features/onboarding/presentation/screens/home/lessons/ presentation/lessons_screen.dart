
import 'package:flutter/material.dart';

import '../../account/subscriptions/presentation/screens/subscribe_screen.dart';
import 'lesson_quiz_screen.dart';


class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  String? selectedLessonKey;
  final ScrollController _scrollController = ScrollController();

  late final List<Map<String, dynamic>> _lessons;

  @override
  void initState() {
    super.initState();
    _lessons = [
      {
        "lessonNumber": "الدرس الاول",
        "title": "الفرق بين {a-an}",
        "icon": Icons.bookmark,
        "isLocked": false,
        "key": "a-an",
      },
      {
        "lessonNumber": "الدرس الثاني",
        "title": "الفرق بين {this-that}",
        "icon": Icons.bookmark,
        "isLocked": false,
        "key": "this-that",
      },
      {
        "lessonNumber": "الدرس الثالث",
        "title": "الفرق بين {these-those}",
        "icon": Icons.lock,
        "isLocked": true,
        "key": "these-those",
      },
      {
        "lessonNumber": "الدرس الرابع",
        "title": "الأفعال المساعدة",
        "icon": Icons.lock,
        "isLocked": true,
        "key": "verbs",
      },
      {
        "lessonNumber": "الدرس الخامس",
        "title": "الأفعال المساعدة",
        "icon": Icons.lock,
        "isLocked": true,
        "key": "verbs2",
      },
    ];
  }

  void _scrollToContent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }



  Widget _buildLessonContent(String lessonKey) {
    if (lessonKey == "a-an") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "وصف الدرس",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "يوضح هنا وصف الدرس والذي عادة ما يتكون من عدة اسطر كهذا المثال. يوضع هنا وصف الدرس والذي عادة ما يتكون من عدة اسطر. يوضح هنا وصف الدرس والذي عادة ما يتكون من عدة اسطر.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 15),
            const Text(
              "شرح الفرق بين a و an بالتفصيل",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "قبل الشرح لازم نعرف حروف العلة او الحروف المتحركة وهي (A-E-I-O-U) ",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "تأتي قبل الأسماء المفردة المعدودة, وقبل الوظيفة أو مجموعة معينة من الناس أو الجنسية.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "a day a مع الأرقام التي تعني كل ' مثل a '.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "وقد نستخدم an - مع الأسماء المحتوية والأسماء\nالمعادة و فعل الجمع او الأسماء الغير معدودة.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "نستخدم (A-E-I-O-U) أداة للنكرة التي لا تبدأ بحرف علة اي التي an\nو a أداة للنكرة التي لا تبدأ بأحد حروف العلة او الحروف المتحركة",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "نستخدم a قبل اسم مفرد معدود يبدأ بحرف ساكن.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "أمثلة:",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const Text(
              "- إنها هدية. It's a present.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "- إنه يوم جميل. It's a lovely day.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "- هل أنت طبيب؟ Are you a doctor?",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "- أنا عندي بنت وولدين. I have got a daughter and two sons.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "انتبه!",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Text(
              "نستخدم a قبل الاسم الجمع وكذلك قبل\nالأسماء الغير معدودة.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              "نستخدم a قبل اسم مفرد معدود يبدأ بحرف ساكن.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LessonQuizScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF2A72AD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "انهي الدرس",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    } else if (lessonKey == "this-that") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "وصف الدرس",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "يوضح هنا وصف الدرس والذي عادة ما يتكون من عدة اسطر كهذا المثال. يوضع هنا وصف الدرس والذي عادة ما يتكون من عدة اسطر. يوضح هنا وصف الدرس والذي عادة ما يتكون من عدة اسطر.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 15),
            const Text(
              "شرح الفرق بين {this-that}",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "this ➝ نستخدمها للقريب.\n"
                  "that ➝ نستخدمها للبعيد.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LessonQuizScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF2A72AD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "انهي الدرس",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          "assets/images/Group 484070.png",
                          width: 356,
                          height: 192,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedLessonKey = "a-an";
                              });
                              _scrollToContent();
                            },
                            child: Container(
                              width: 291,
                              height: 51,
                              decoration: BoxDecoration(
                                color: const Color(0XFF2A72AD),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  "ابدأ الدرس الاول",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                if (selectedLessonKey == null) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "القواعد",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                            height: 42 / 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "الوصف",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                            height: 42 / 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "بوضع سنتوقف هذا الاختبار والذي عادة ما يتكون من عدة اسطر كهذا المثال. يوضع هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر. يوضح هنا وصف الاختبار والذي عادة ما يتكون من عدة اسطر ... المزيد",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "الدروس",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ..._lessons.map((lesson) {
                  return Column(
                    children: [
                      LessonCard(
                        lessonNumber: lesson["lessonNumber"],
                        title: lesson["title"],
                        icon: lesson["icon"],
                        isLocked: lesson["isLocked"],
                        onTap: () {
                          if (!lesson["isLocked"]) {
                            setState(() {
                              selectedLessonKey = selectedLessonKey == lesson["key"]
                                  ? null
                                  : lesson["key"];
                            });
                          } else {
                            if (lesson["key"] == "these-those") {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: const EdgeInsets.all(20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    content: SizedBox(
                                      width: 339,
                                      height: 264,
                                      child: Stack(
                                        children: [
                                          /// زر الإغلاق (X)
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: IconButton(
                                              icon: const Icon(Icons.close, color: Colors.black),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),

                                          /// الصورة
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Image.asset(
                                              "assets/images/error-ptG7lRTi2j.png",
                                              width: 200,
                                              height: 100,
                                            ),
                                          ),

                                          /// النص
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: const Text(
                                                "من فضلك استكمل الدرس السابق\nلتتمكن من فتح هذا الدرس",
                                                textAlign: TextAlign.center, // 👈 النص في النص
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );

                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SubscribeScreen()),
                              );
                            }
                          }
                          _scrollToContent();
                        },
                      ),
                      if (selectedLessonKey == lesson["key"])
                        _buildLessonContent(lesson["key"]),
                    ],
                  );
                }).toList(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String lessonNumber;
  final String title;
  final IconData icon;
  final bool isLocked;
  final VoidCallback? onTap;

  const LessonCard({
    Key? key,
    required this.lessonNumber,
    required this.title,
    required this.icon,
    required this.isLocked,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  lessonNumber,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            if (isLocked)
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "اشترك",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    icon,
                    color: Colors.black,
                  ),
                ],
              )
            else
              Icon(
                icon,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}