import 'package:flutter/material.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    const Text(
                      'الاشتراكات',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Container(
                  height: 498,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // top rounded blue strip
                      Container(
                        width: double.infinity,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2A72AD),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 18.0),
                        child: Column(
                          children: [
                            const Text(
                              'اشتراك اسبوعي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'وصف خطة الاشتراك هنا والذي عادة ما يتكون من\nعدة أسطر وصف خطة الاشتراك هنا والذي عادة ما\nيتكون من عدة اسطر.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9B9B9B),
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 18),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(Icons.check_circle,
                                        color: Color(0xFFFE9F45), size: 18),
                                    SizedBox(width: 8),
                                    Text(
                                      'وصف الميزة هنا',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF6D6D6D),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(Icons.check_circle,
                                        color: Color(0xFFFE9F45), size: 18),
                                    SizedBox(width: 8),
                                    Text(
                                      'وصف الميزة هنا',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF6D6D6D),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'تاريخ التجديد 2023 يناير',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFB0B0B0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'السعر',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF1F1F1F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          '70 د.ل',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF1F1F1F),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          ' د.ل70',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFDD2C00),
                                            decoration:
                                            TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFECECEC),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    'تجديد الاشتراك',
                                    style: TextStyle(
                                      color: Color(0xFFBDBDBD),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
