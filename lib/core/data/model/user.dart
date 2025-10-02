class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? image;
  final String? deviceToken;
  final int status;
  final int verified;
  final String? otp;
  final String createdAt;
  final String? updatedAt; // Only present in 'home' user object
  final String? emailVerifiedAt; // Only present in 'home' user object

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.image,
    this.deviceToken,
    required this.status,
    required this.verified,
    this.otp,
    required this.createdAt,
    this.updatedAt,
    this.emailVerifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      // The rest of the fields are nullable and can be accessed safely
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      deviceToken: json['device_token'] as String?,
      status: json['status'] as int,
      verified: json['verified'] as int,
      otp: json['otp'] as String?,
      createdAt: json['created_at'] as String,
      // These are nullable fields that may not be in every User JSON (e.g., 'profile' vs 'home')
      updatedAt: json['updated_at'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
    );
  }
}

// Class for the top-level 'profile' JSON structure
