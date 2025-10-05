class SingleCatgoryResponse {
  Data? data;

  SingleCatgoryResponse({this.data});

  SingleCatgoryResponse.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? cover;
  int? status;
  String? content;
  String? createdAt;
  int? lessonsCount;
  List<Lessons>? lessons;

  Data(
      {this.id,
        this.title,
        this.image,
        this.cover,
        this.status,
        this.content,
        this.createdAt,
        this.lessonsCount,
        this.lessons});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    cover = json['cover'];
    status = json['status'];
    content = json['content'];
    createdAt = json['created_at'];
    lessonsCount = json['lessons_count'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['cover'] = this.cover;
    data['status'] = this.status;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['lessons_count'] = this.lessonsCount;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? id;
  String? title;
  String? content;
  int? categoryId;
  String? image;
  String? gallery;
  String? audio;
  int? status;
  int? views;
  int? order;
  int? paid;
  String? createdAt;
  String? updatedAt;

  Lessons(
      {this.id,
        this.title,
        this.content,
        this.categoryId,
        this.image,
        this.gallery,
        this.audio,
        this.status,
        this.views,
        this.order,
        this.paid,
        this.createdAt,
        this.updatedAt});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    categoryId = json['category_id'];
    image = json['image'];
    gallery = json['gallery'];
    audio = json['audio'];
    status = json['status'];
    views = json['views'];
    order = json['order'];
    paid = json['paid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['audio'] = this.audio;
    data['status'] = this.status;
    data['views'] = this.views;
    data['order'] = this.order;
    data['paid'] = this.paid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
