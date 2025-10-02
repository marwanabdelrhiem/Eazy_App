class ProfileData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? image;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'],
    );
  }
}