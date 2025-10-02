class Setting {
  final int id;
  final String title;
  final String logo;
  final String favicon;
  final String facebook;
  final String twitter;
  final String snapchat;
  final String youtube; // Note: Corrected 'yourube' to 'youtube' for the field
  final String tiktok;
  final String instagram;
  final String phone;
  final String email;
  final String address;
  final String createdAt;
  final String updatedAt;

  Setting({
    required this.id,
    required this.title,
    required this.logo,
    required this.favicon,
    required this.facebook,
    required this.twitter,
    required this.snapchat,
    required this.youtube,
    required this.tiktok,
    required this.instagram,
    required this.phone,
    required this.email,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      id: json['id'] as int,
      title: json['title'] as String,
      logo: json['logo'] as String,
      favicon: json['favicon'] as String,
      facebook: json['facebook'] as String,
      twitter: json['twitter'] as String,
      snapchat: json['snapchat'] as String,
      youtube: json['yourube'] as String, // Using the JSON key 'yourube'
      tiktok: json['tiktok'] as String,
      instagram: json['instagram'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}