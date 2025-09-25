import 'package:eazy/features/onboarding/presentation/screens/home/account/others/ContPage.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/account/others/QuestPage.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/account/others/SubPage.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/account/others/TermsPage.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/account/subscriptions/presentation/screens/subscribe_screen.dart';
import 'package:flutter/material.dart';
import 'account_created_screen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  Widget _buildListTile(String title, Widget leadingWidget,{VoidCallback? onTap}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: leadingWidget,
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1A201D),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: Color(0xFF1A201D),
          size: 30,
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'حسابي',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 10),
          child: IconButton(
            icon: Image.asset("assets/images/notification-bell 1.png", height: 34, width: 34),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 16.0, right: 31.0),
            child: Image.asset(
              'assets/images/Eazy.png',
              height: 36,
              width: 56,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFA),
                  borderRadius: BorderRadius.circular(19),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/images/mohamed omran.jpg'),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'محمد عمران',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const PersonalData()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/write.png",
                                      width: 16,
                                      height: 16,
                                      color: const Color(0xFF2A72AD),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'تعديل حسابي',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF2A72AD),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('سيتم تحويلك الأن !'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/crown 1.png',
                            width: 25,
                            height: 25,
                            color: const Color(0xFFFE9F45),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "الترقية إلي النسخة المميزة",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFE9F45),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

            Column(
              children: [
                _buildListTile(
                  'الاشتراكات',
                  Image.asset(
                    "assets/images/subscription 1.png",
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SubscribeScreen()),
                    );
                  },
                ),

                _buildListTile(
                  'الأسئلة الشائعة',
                  Image.asset(
                    "assets/images/question 1.png",
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  QuestPage()),
                    );
                  },
                ),

                _buildListTile(
                  'الشروط والأحكام',
                  Image.asset(
                    "assets/images/condition 1.png",
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TermsPage()),
                    );
                  },
                ),

                _buildListTile(
                  'تواصل معنا',
                  Image.asset(
                    "assets/images/call 1.png",
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ContPage()),
                    );
                  },
                ),

                _buildListTile(
                  'مشاركة التطبيق',
                  Image.asset(
                    "assets/images/share (1) 2.png",
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {
                  },
                ),
              ],
            ),



              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "تسجيل الخروج",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "هل ترغب في تسجيل الخروج؟",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("تراجع"),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2A72AD), // لون الزر
                                      foregroundColor: Colors.white, // لون النص
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(context, "/auth");
                                    },
                                    child: const Text("نعم"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    color: Color(0xFF8C8C8C),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
