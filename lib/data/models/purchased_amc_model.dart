class PurchasedAMCModel {
  int? errorCode;
  List<Msg>? msg;

  PurchasedAMCModel({this.errorCode, this.msg});

  PurchasedAMCModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    if (json['msg'] != null) {
      msg = <Msg>[];
      json['msg'].forEach((v) {
        msg!.add(Msg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    if (msg != null) {
      data['msg'] = msg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Msg {
  String? id;
  String? amcName;

  Msg({this.id, this.amcName});

  Msg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amcName = json['amc_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amc_name'] = amcName;
    return data;
  }
}