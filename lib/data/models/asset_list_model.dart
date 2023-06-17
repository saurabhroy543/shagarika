class AssetListModel {
  int? errorCode;
  List<Msg>? msg;

  AssetListModel({this.errorCode, this.msg});

  AssetListModel.fromJson(Map<String, dynamic> json) {
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
  String? assetType;
  int? purchaseValue;
  int? currentValue;
  int? allot;

  Msg({this.assetType, this.purchaseValue, this.currentValue, this.allot});

  Msg.fromJson(Map<String, dynamic> json) {
    assetType = json['asset_type'];
    purchaseValue = json['purchase_value'];
    currentValue = json['current_value'];
    allot = json['allot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asset_type'] = assetType;
    data['purchase_value'] = purchaseValue;
    data['current_value'] = currentValue;
    data['allot'] = allot;
    return data;
  }
}