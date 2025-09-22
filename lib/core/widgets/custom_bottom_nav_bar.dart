// File: lib/core/widgets/custom_bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:eazy/core/constants/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      // color: Colors.transparent,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 90),
            painter: _NavPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: SizedBox(
              width: 54,
              height: 54,
              child: FloatingActionButton(
                // backgroundColor: kBlackColor,
                onPressed: () => onItemTapped(1), // Index 1 for the middle FAB
                elevation: 0.1,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.home_outlined,
                  color: kWhiteColor,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.person, "حسابي", 0),
                const SizedBox(width: 54),
                _buildNavItem(Icons.menu_book, "دروسي", 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? kPrimaryColor : kMediumGrayColor,
            size: 30,
          ),
          if (label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? kPrimaryColor : kMediumGrayColor,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = kLightGrayColor
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}