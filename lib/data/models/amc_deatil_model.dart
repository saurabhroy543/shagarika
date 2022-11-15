class AmcDetailModel {
  int? errorCode;
  Msg? msg;

  AmcDetailModel({this.errorCode, this.msg});

  AmcDetailModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    msg = json['msg'] != null ? Msg.fromJson(json['msg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    if (msg != null) {
      data['msg'] = msg!.toJson();
    }
    return data;
  }
}

class Msg {
  int? purchaseValue;
  int? currentValue;
  int? gain;
  String? abs;
  List<Amc>? amc;

  Msg({this.purchaseValue, this.currentValue, this.gain, this.abs, this.amc});

  Msg.fromJson(Map<String, dynamic> json) {
    purchaseValue = json['purchase_value'];
    currentValue = json['current_value'];
    gain = json['gain'];
    abs = json['abs'];
    if (json['amc'] != null) {
      amc = <Amc>[];
      json['amc'].forEach((v) {
        amc!.add(Amc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purchase_value'] = purchaseValue;
    data['current_value'] = currentValue;
    data['gain'] = gain;
    data['abs'] = abs;
    if (amc != null) {
      data['amc'] = amc!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Amc {
  String? amcCode;
  int? amount;
  int? currentValue;
  dynamic percentage;
  String? aMCName;

  Amc(
      {this.amcCode,
        this.amount,
        this.currentValue,
        this.percentage,
        this.aMCName});

  Amc.fromJson(Map<String, dynamic> json) {
    amcCode = json['amc_code'];
    amount = json['amount'];
    currentValue = json['current_value'];
    percentage = json['percentage'];
    aMCName = json['AMC_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amc_code'] = amcCode;
    data['amount'] = amount;
    data['current_value'] = currentValue;
    data['percentage'] = percentage;
    data['AMC_name'] = aMCName;
    return data;
  }
}
