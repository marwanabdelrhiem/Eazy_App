import 'package:eazy/features/onboarding/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eazy/core/widgets/custom_bottom_nav_bar.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/account/presentation/screens/profile_screen.dart';

import 'lessons/ presentation/my_lessons_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1; // 👈 نبدأ بالـ Home

  final List<Widget> _screens = [
    const ProfileScreen(),    // حسابي (index 0)
    const HomeBody(),         // الصفحة الرئيسية (index 1)
    const MyLessonsScreen(),  // دروسي (index 2)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
