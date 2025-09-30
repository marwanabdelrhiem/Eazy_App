class LoginResponseModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  int? status;
  int? verified;
  Null? type;

  LoginResponseModel(
      {this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.status,
        this.verified,
        this.type});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    status = json['status'];
    verified = json['verified'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['status'] = this.status;
    data['verified'] = this.verified;
    data['type'] = this.type;
    return data;
  }
}
