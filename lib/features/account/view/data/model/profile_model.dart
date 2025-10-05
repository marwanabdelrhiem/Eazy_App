class ProfileResponse {
  Data? data;

  ProfileResponse({this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;        // كان Null? بقى String?
  String? deviceToken;  // كان Null? بقى String?
  int? status;
  int? verified;
  String? otp;          // كان Null? بقى String?
  String? createdAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.deviceToken,
    this.status,
    this.verified,
    this.otp,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    deviceToken = json['device_token'];
    status = json['status'];
    verified = json['verified'];
    otp = json['otp'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['device_token'] = deviceToken;
    data['status'] = status;
    data['verified'] = verified;
    data['otp'] = otp;
    data['created_at'] = createdAt;
    return data;
  }
}
