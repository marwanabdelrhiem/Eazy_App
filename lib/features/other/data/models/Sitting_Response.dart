class SittingResponse {
  Data? data;

  SittingResponse({this.data});

  SittingResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? logo;
  String? favicon;
  String? facebook;
  String? twitter;
  String? snapchat;
  String? yourube;
  String? tiktok;
  String? instagram;
  String? phone;
  String? email;
  String? address;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.logo,
        this.favicon,
        this.facebook,
        this.twitter,
        this.snapchat,
        this.yourube,
        this.tiktok,
        this.instagram,
        this.phone,
        this.email,
        this.address,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    logo = json['logo'];
    favicon = json['favicon'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    yourube = json['yourube'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['favicon'] = this.favicon;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['snapchat'] = this.snapchat;
    data['yourube'] = this.yourube;
    data['tiktok'] = this.tiktok;
    data['instagram'] = this.instagram;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
