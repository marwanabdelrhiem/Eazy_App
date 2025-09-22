import 'package:flutter/material.dart';

import 'lessons_screen.dart';

// عايزك تظبط ده يبقي يمين

class MyLessonsScreen extends StatelessWidget {
  const MyLessonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'دروسي',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 44),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF5A5A5A),
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                    ),

                  ],
                ),
                const SizedBox(height: 25),

                _buildLessonCard(
                  context: context,
                  title: 'الفرق بين (a-an)',
                  subtitle: '4 أسئلة تقييم وتمارين',
                  duration: '5 دقائق',
                  isCompleted: false,
                ),
                const SizedBox(height: 16),
                _buildLessonCard(
                  context: context,
                  title: 'الدرس الثاني - الوظائف',
                  subtitle: 'قسم الكلمات',
                  isCompleted: true,
                ),
                const SizedBox(height: 16),
                _buildLessonCard(
                  context: context,
                  title: 'الدرس الثاني - الوظائف',
                  subtitle: 'قسم الكلمات',
                  isCompleted: true,
                ),
                const SizedBox(height: 16),
                _buildLessonCard(
                  context: context,
                  title: 'الدرس الثاني - الوظائف',
                  subtitle: 'قسم الكلمات',
                  isCompleted: true,
                ),
                const SizedBox(height: 16),
                _buildLessonCard(
                  context: context,
                  title: 'الدرس الثاني - الوظائف',
                  subtitle: 'قسم الكلمات',
                  isCompleted: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLessonCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    String? duration,
    required bool isCompleted,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFA),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF8F8F8F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (!isCompleted) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                duration!,
                                style: const TextStyle(
                                  color: Color(0xFF8F8F8F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: 185,
                                height: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: const LinearProgressIndicator(
                                    value: 0.15,
                                    backgroundColor: Color(0xFFE0E0E0),
                                    valueColor: AlwaysStoppedAnimation(Color(0xFFF9A825)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LessonScreen()),
                            );
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 111,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C64B0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'استكمل',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.bookmark,
              color: Color(0xFFF9A825),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}