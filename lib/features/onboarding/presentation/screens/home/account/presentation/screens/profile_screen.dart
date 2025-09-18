// File: lib/features/account/presentation/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:eazy/core/constants/colors.dart';

// TODO: Create these screens
class MyLessonsScreen extends StatelessWidget {
  const MyLessonsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('شاشة دروسي'));
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('شاشة المزيد'));
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhiteColor,
      body: _ProfileContent(),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        leading: Icon(icon, color: kPrimaryColor),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: kMediumGrayColor),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // البروفايل
            Container(
              decoration: BoxDecoration(
                color: kLightGrayColor,
                borderRadius: BorderRadius.circular(19),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                textDirection: TextDirection.rtl,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/mohamed omran.jpg'),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'محمد عمران',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'تعديل حسابي',
                            style: TextStyle(
                              fontSize: 14,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.edit, color: kPrimaryColor, size: 18),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // زر الترقية
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  color: kLightOrangeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/crown (1) 1.png', height: 26, width: 26),
                    const SizedBox(width: 8),
                    const Text(
                      "الترقية إلي النسخة المميزة",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kAccentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // القائمة
            _buildMenuItem("الاشتراكات", Icons.subscriptions, () {}),
            _buildMenuItem("الأسئلة الشائقة", Icons.help_outline, () {}),
            _buildMenuItem("الشروط والأحكام", Icons.article_outlined, () {}),
            _buildMenuItem("تواصل معنا", Icons.call, () {}),
            _buildMenuItem("مشاركة التطبيق", Icons.share, () {}),
            const SizedBox(height: 32),
            // تسجيل الخروج
            TextButton(
              onPressed: () {},
              child: const Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: kMediumGrayColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
