// File: lib/features/home/presentation/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:eazy/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          // App Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, size: 30, color: kBlackColor),
                onPressed: () {
                  // TODO: Navigate to notifications screen
                },
              ),
              Row(
                children: [
                  const Text(
                    'مرحبا بك في ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo_mini.png',
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: kLightGrayColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: kMediumGrayColor),
                SizedBox(width: 10),
                Text(
                  'ابحث عن درس',
                  style: TextStyle(
                    color: kMediumGrayColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Offers Section
          const Text(
            'أحدث العروض',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Placeholder for Offer Carousel
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: kLightOrangeColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'اشتراك بخصم 20% وتعلم جميع الدروس على إيزي',
                style: TextStyle(color: kAccentColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Categories Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المزيد',
                style: TextStyle(
                  fontSize: 16,
                  color: kMediumGrayColor,
                ),
              ),
              Text(
                'الأقسام',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Placeholder for Categories Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: kLightGrayColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 50, color: kPrimaryColor),
                    SizedBox(height: 10),
                    Text(
                      'اسم القسم',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          // Continue Lessons Section
          const Text(
            'أستكمل دروسك',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Placeholder for Continue Lessons Card
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Text(
                  'الفرق بين (a-an)',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '4 أسئلة تقييم وتمارين في 5 دقائق',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}