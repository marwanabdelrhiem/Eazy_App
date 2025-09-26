import 'package:eazy/features/onboarding/presentation/screens/home/account/subscriptions/presentation/screens/subscriptions_list_screen.dart';
import 'package:flutter/material.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C81BF),
      body: Stack(
        children: [
          // Close button (Square with rounded corners)
          Positioned( // Corrected spelling
            top: 50,
            right: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white, // Solid white background
                borderRadius: BorderRadius.circular(10), // Rounded corners for the square
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black, size: 24), // Black icon
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          // Lock image and text
          Positioned(
            top: 77,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/lock.png",
                  width: 85,
                  height: 85,
                ),
                const SizedBox(height: 10),
                Image.asset(
                  "assets/images/تسجيل دخول.png",
                  width: 196,
                  height: 72,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Large bottom image
          Positioned(
            top: 315,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubscriptionsScreen(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/Group 484118.png",
                width: 355,
                height: 470,
              ),
            ),
          ),

        ],
      ),
    );
  }
}