import 'package:eazy/features/onboarding/presentation/screens/home/notifications/presentation/screens/notifications_screen.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/search_screen.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/category.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/home_banner.dart';

import 'package:flutter/material.dart';

import 'lessons/ presentation/lesson_quiz_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}
//مقموص مجدي
class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: Column(
        children: [
          // ======== Header Section ========
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsScreen(notifications: [
                        {
                          'title': 'اسم الإشعار',
                          'body': 'تفاصيل الاشعار هنا تفاصيل الاشعار هنا تفاصيل الاشعار هنا'
                        },
                        {
                          'title': 'اسم الإشعار',
                          'body': 'تفاصيل الاشعار هنا تفاصيل الاشعار هنا تفاصيل الاشعار هنا'
                        },
                        {
                          'title': 'اسم الإشعار',
                          'body': 'تفاصيل الاشعار هنا تفاصيل الاشعار هنا تفاصيل الاشعار هنا'
                        },
                        {
                          'title': 'اسم الإشعار',
                          'body': 'تفاصيل الاشعار هنا تفاصيل الاشعار هنا تفاصيل الاشعار هنا'
                        },
                      ]),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/notification-bell 1@2x.png',
                  width: 34,
                  height: 34,
                ),
              ),
              const Spacer(), // Use Spacer for flexible spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/images/Eazyblack.png',
                    height: 24,
                  ),
                  const Text(
                    'مرحبا بك في ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 27),

          // ======== Search Bar ========
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
            child: AbsorbPointer(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'ابحث عن درس',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Image.asset(
                        'assets/images/search-normal 1.png',
                        height: 22,
                        width: 20,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 27),

          // ======== Scrollable Content ========
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'أحدث العروض',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const HomeBanner(),
                  const Category(),
                  const SizedBox(height: 5),
                  const Text(
                    'استكمل دروسك',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // ==== Lesson Card ====
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: 148,
                      width: 355,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'الفرق بين {a-an}',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text('4 اسئلة تقييم وتمارين '),
                                    Text('5 دقائق '),
                                  ],
                                ),
                              ),
                              SizedBox(width: 150),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/Vector.png',
                                  height: 20,
                                  width: 17.37,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(),
                          Row(
                            children: [
                              SizedBox(
                                width: 185,
                                height: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: LinearProgressIndicator(
                                    value: 0.08,
                                    backgroundColor: Colors.grey[300],
                                    valueColor: const AlwaysStoppedAnimation(Color(0xFFFE9F45)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 55),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LessonQuizScreen(),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2A72AD),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'استكمل',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
