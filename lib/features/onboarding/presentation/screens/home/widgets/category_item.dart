import 'package:eazy/features/onboarding/presentation/screens/home/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/data/model/category.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Text(
          category.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}