import 'package:eazy/core/data/model/category.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/data/model/category_model.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/network/api_service.dart';
import '../../../../../core/data/repo/lessons repo/lessons_remote_data_source.dart';
import '../../../../../core/data/repo/lessons repo/lessons_repository_impl.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoryData> categories;
  final void Function(String)? onCategoryTap;

  const CategoriesScreen({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //---------------------------App Bar-------------------------//
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'الأقسام',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
        ],
        centerTitle: true,
      ),

      //---------------------------Category body-------------------------//
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              onTap: () {
                if (onCategoryTap != null) {
                  onCategoryTap!(category.title);
                }
              },
              child: CategoryItem(category: category),
            );
          },
        ),
      ),
    );
  }
}
