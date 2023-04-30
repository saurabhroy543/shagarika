class SendMailModel {
  int ?errorCode;
  String? msg;

  SendMailModel({this.errorCode, this.msg});

  SendMailModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    data['msg'] = msg;
    return data;
  }
}