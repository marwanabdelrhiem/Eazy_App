class SliderModel {
  final int id;
  final String image;
  final int status;
  final String createdAt;
  final String updatedAt;

  SliderModel({
    required this.id,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'] as int,
      image: json['image'] as String,
      status: json['status'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}