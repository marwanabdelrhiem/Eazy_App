class HomeResponse {
  List<Slider>? slider;
  User? user;
  List<Categories>? categories;

  HomeResponse({this.slider, this.user, this.categories});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  int? id;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Slider({this.id, this.image, this.status, this.createdAt, this.updatedAt});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? otp;
  String? deviceToken;
  String? emailVerifiedAt;
  int? status;
  int? verified;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.otp,
    this.deviceToken,
    this.emailVerifiedAt,
    this.status,
    this.verified,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    otp = json['otp'];
    deviceToken = json['device_token'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    verified = json['verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['otp'] = otp;
    data['device_token'] = deviceToken;
    data['email_verified_at'] = emailVerifiedAt;
    data['status'] = status;
    data['verified'] = verified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Categories {
  int? id;
  String? title;
  String? image;
  String? cover;
  int? status;
  String? content;
  String? createdAt;

  Categories({
    this.id,
    this.title,
    this.image,
    this.cover,
    this.status,
    this.content,
    this.createdAt,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    cover = json['cover'];
    status = json['status'];
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['cover'] = cover;
    data['status'] = status;
    data['content'] = content;
    data['created_at'] = createdAt;
    return data;
  }
}
