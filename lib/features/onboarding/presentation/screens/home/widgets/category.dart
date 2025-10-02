
import 'package:eazy/core/data/model/category.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/category_screen.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/data/model/category_model.dart';
import 'package:eazy/features/onboarding/presentation/screens/home/widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/data/network/api_service.dart';
import '../../../../../../core/data/repo/lessons repo/lessons_remote_data_source.dart';
import '../../../../../../core/data/repo/lessons repo/lessons_repository_impl.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late LessonsRepositoryImpl repo;
  List<CategoryData> categories = [];
  bool isLoading = true;
  String error = "";

  @override
  void initState() {
    super.initState();
    final api = ApiService();
    final dataSource = LessonsRemoteDataSource(api);
    repo = LessonsRepositoryImpl(dataSource);
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final response = await repo.getCategories();
      setState(() {
        categories = response.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error.isNotEmpty) {
      return Center(child: Text("خطأ: $error"));
    }

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
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: categories.length > 6 ? 6 : categories.length,
            itemBuilder: (context, index) {
              return CategoryItem(category: categories[index]);
            },
          ),
        ],
      ),
    );
  }
}