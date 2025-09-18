import 'package:flutter/material.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A72AD),
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
                  "assets/images/Group 484121.png",
                  width: 196,
                  height: 188.2449951171875,
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
            child: Image.asset(
              "assets/images/Group 484118.png",
              width: 355,
              height: 470,
            ),
          ),
        ],
      ),
    );
  }
}