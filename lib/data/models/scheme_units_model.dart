class SchemeUnitsModel {
  int? errorCode;
  List<Msg>? msg;

  SchemeUnitsModel({this.errorCode, this.msg});

  SchemeUnitsModel.fromJson(Map<String, dynamic> json) {
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
  String? scheme;
  String? prodcode;
  String? folioNo;
  String? units;
  String? amcCode;
  String? navDate;
  String? purPrice;
  double? availableAmount;

  Msg(
      {this.scheme,
        this.prodcode,
        this.folioNo,
        this.units,
        this.amcCode,
        this.navDate,
        this.purPrice,
        this.availableAmount});

  Msg.fromJson(Map<String, dynamic> json) {
    scheme = json['scheme'];
    prodcode = json['prodcode'];
    folioNo = json['folio_no'];
    units = json['units'];
    amcCode = json['amc_code'];
    navDate = json['nav_date'];
    purPrice = json['pur_price'];
    availableAmount = json['available_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scheme'] = scheme;
    data['prodcode'] = prodcode;
    data['folio_no'] = folioNo;
    data['units'] = units;
    data['amc_code'] = amcCode;
    data['nav_date'] = navDate;
    data['pur_price'] = purPrice;
    data['available_amount'] = availableAmount;
    return data;
  }
}