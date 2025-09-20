class CategoryModel {
  final String name;
  final String imagePath;
  const CategoryModel({
    required this.name,
    required this.imagePath,
  });
}


const List<CategoryModel> categories = [
  CategoryModel(name: 'الاستماع', imagePath: 'assets/images/man.png'),
  CategoryModel(name: 'كلمات', imagePath: 'assets/images/reading-book.png'),
  CategoryModel(name: 'القواعد', imagePath: 'assets/images/puzzle.png'),
  CategoryModel(name: 'الاستماع', imagePath: 'assets/images/man.png'),
  CategoryModel(name: 'كلمات', imagePath: 'assets/images/reading-book.png'),
  CategoryModel(name: 'القواعد', imagePath: 'assets/images/puzzle.png'),


];