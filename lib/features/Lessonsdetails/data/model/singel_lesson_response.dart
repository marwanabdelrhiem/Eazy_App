class SingleLessonResponse {
  Data? data;

  SingleLessonResponse({this.data});

  SingleLessonResponse.fromJson(Map<String, dynamic> json) {
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
  String? content;
  int? categoryId;
  String? category;
  String? image;
  List<String>? gallery;
  String? audio;
  int? status;
  int? views;
  int? order;
  int? paid;
  String? createdAt;
  List<Questions>? questions;

  Data(
      {this.id,
        this.title,
        this.content,
        this.categoryId,
        this.category,
        this.image,
        this.gallery,
        this.audio,
        this.status,
        this.views,
        this.order,
        this.paid,
        this.createdAt,
        this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    categoryId = json['category_id'];
    category = json['category'];
    image = json['image'];
    gallery = json['gallery'].cast<String>();
    audio = json['audio'];
    status = json['status'];
    views = json['views'];
    order = json['order'];
    paid = json['paid'];
    createdAt = json['created_at'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['audio'] = this.audio;
    data['status'] = this.status;
    data['views'] = this.views;
    data['order'] = this.order;
    data['paid'] = this.paid;
    data['created_at'] = this.createdAt;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  String? title;
  List<Answers>? answers;

  Questions({this.id, this.title, this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? title;
  int? isCorrect;

  Answers({this.id, this.title, this.isCorrect});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isCorrect = json['is_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['is_correct'] = this.isCorrect;
    return data;
  }
}
