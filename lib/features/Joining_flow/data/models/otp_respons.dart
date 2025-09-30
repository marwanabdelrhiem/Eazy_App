class otprespons {
  int? otp;
  String? message;

  otprespons({this.otp, this.message});

  otprespons.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['message'] = this.message;
    return data;
  }
}
