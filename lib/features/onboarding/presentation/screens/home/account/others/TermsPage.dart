import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // ✅ يرجع للشاشة السابقة
            },
          ),
          title: const Text(
            'الشروط والأحكام',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  height: 496,
                  width: 355,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFA),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const SingleChildScrollView(
                    child: Text(
                      "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . "
                          "يوضع هنا نص الشروط والأحكام والذي عادة ما يتكون من عدة أسطر . ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
                    ),
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
