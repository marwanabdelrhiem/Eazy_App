import 'package:eazy/features/onboarding/presentation/screens/home/notifications/presentation/screens/notifications_screen.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/search_screen.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/category.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/home_banner.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_bottom_nav_bar.dart';
import 'account/presentation/screens/profile_screen.dart';
import 'lessons/ presentation/lesson_quiz_screen.dart';
import 'lessons/ presentation/my_lessons_screen.dart';
//---------------------------Marwan Ashraf-------------------------//

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedIndex = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      body: Stack(
        children: [

          //---------------------------Home body-------------------------//

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 200), // مسافة للهيدر + السيرش
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
                              const SizedBox(width: 140),
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
                              const SizedBox(width: 65),
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
                                  width: 111,
                                  height: 42,
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
                  ),

                ],
              ),
            ),
          ),

          // ======== الهيدر + السيرش معًا (شفاف) ========
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(19),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // --- الهيدر ---
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
                        const Spacer(),
                        Row(
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

                    // --- سيرش بار ---
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
