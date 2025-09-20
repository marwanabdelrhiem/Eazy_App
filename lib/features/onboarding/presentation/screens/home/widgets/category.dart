
import 'package:eazy/features/onboarding/presentation/screens/home/category_screen.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/data/model/category_model.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/category_item.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====== العنوان + المزيد ======
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesScreen(
                        categories: categories,

                      ),
                    ),
                  );
                },
                child: const Text(
                  "المزيد",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),


               const Text(
                  "الأقسام",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

            ],
          ),
          const SizedBox(height: 12),

          // ====== الشبكة ======
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,      // 3 أعمدة
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,    // مربعات متساوية
            ),
            itemCount: 6,             // مؤقت لغاية ما تملأ البيانات
            itemBuilder: (context, index) {
              return CategoryItem(category: categories[index]);
            },
          ),
        ],
      ),
    );
  }
}
