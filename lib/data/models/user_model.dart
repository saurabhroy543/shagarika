class UserModel {
  int? errorCode;
  String? msg;
  UserDetail? user_detail;

  UserModel({this.errorCode, this.msg, this.user_detail});

  UserModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    msg = json['msg'];
    user_detail = json['user_detail'] != null
        ? UserDetail.fromJson(json['user_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    data['msg'] = msg;
    if (user_detail != null) {
      data['user_detail'] = user_detail?.toJson();
    }
    return data;
  }
}

class UserDetail {
  String? name;
  String? userId;
  String? role;
  String? pan;
  String? mobile;
  String? email;

  UserDetail(
      {this.name, this.userId, this.role, this.pan, this.mobile, this.email});

  UserDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    role = json['role'];
    pan = json['pan'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['user_id'] = userId;
    data['role'] = role;
    data['pan'] = pan;
    data['mobile'] = mobile;
    data['email'] = email;
    return data;
  }
}
