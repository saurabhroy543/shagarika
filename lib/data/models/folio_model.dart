class FolioModel {
  int? errorCode;
  List<Msg>? msg;

  FolioModel({this.errorCode, this.msg});

  FolioModel.fromJson(Map<String, dynamic> json) {
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
  String? folioNo;

  Msg({this.folioNo});

  Msg.fromJson(Map<String, dynamic> json) {
    folioNo = json['folio_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['folio_no'] = folioNo;
    return data;
  }
}
