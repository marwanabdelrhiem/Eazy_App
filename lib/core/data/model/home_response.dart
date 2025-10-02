
import 'package:eazy/core/data/model/slider_model.dart';
import 'package:eazy/core/data/model/user.dart';

import 'category.dart';

class HomeResponse {
  final List<SliderModel> slider;
  final User user;
  final List<CategoryData> categories;

  HomeResponse({
    required this.slider,
    required this.user,
    required this.categories,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      // Convert the JSON list to a List<SliderModel>
      slider: (json['slider'] as List)
          .map((i) => SliderModel.fromJson(i as Map<String, dynamic>))
          .toList(),
      // Convert the 'user' map to a User object
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      // Convert the JSON list to a List<Category>
      categories: (json['categories'] as List)
          .map((i) => CategoryData.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}