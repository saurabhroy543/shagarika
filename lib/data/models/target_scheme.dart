class TargetSchemeModel {
  int? errorCode;
  List<Msg>? msg;

  TargetSchemeModel({this.errorCode, this.msg});

  TargetSchemeModel.fromJson(Map<String, dynamic> json) {
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
  String? schName;

  Msg({this.id, this.schName});

  Msg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schName = json['sch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sch_name'] = schName;
    return data;
  }
}