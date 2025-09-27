import 'package:eazy/features/onboarding/presentation/screens/home/data/model/category_model.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/category_item.dart';
import 'package:flutter/material.dart';


class CategoriesScreen extends StatelessWidget {
  final List<CategoryModel> categories;
  final void Function(String)? onCategoryTap;

  const CategoriesScreen({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> finalCategories = [];

    for (int i = 0; i < 12; i++) {
      final categoryIndex = i % categories.length;
      finalCategories.add(categories[categoryIndex]);
    }

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
          itemCount: 12,
          itemBuilder: (context, index) {
            final category = finalCategories[index];
            return InkWell(
              onTap: () {
                if (onCategoryTap != null) {
                  onCategoryTap!(category.name);
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