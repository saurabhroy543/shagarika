class SchemeDetailModel {
  List<Result>? result;

  SchemeDetailModel({this.result});

  SchemeDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? schName;
  String? purchaseAmount;
  String? addPurchaseAmt;
  String? divReinv;
  String? sipDates;

  Result(
      {this.id,
        this.schName,
        this.purchaseAmount,
        this.addPurchaseAmt,
        this.divReinv,
        this.sipDates});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schName = json['sch_name'];
    purchaseAmount = json['purchase_amount'];
    addPurchaseAmt = json['add_purchase_amt'];
    divReinv = json['div_reinv'];
    sipDates = json['sip_dates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sch_name'] = schName;
    data['purchase_amount'] = purchaseAmount;
    data['add_purchase_amt'] = addPurchaseAmt;
    data['div_reinv'] = divReinv;
    data['sip_dates'] = sipDates;
    return data;
  }
}