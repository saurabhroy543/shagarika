class TotalInvestmentReportModel {
  int? errorCode;
  List<Msg>? msg;

  TotalInvestmentReportModel({this.errorCode, this.msg});

  TotalInvestmentReportModel.fromJson(Map<String, dynamic> json) {
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
  String? invName;
  String? pan;
  int? purchaseValue;
  int? currentValue;
  int? gain;
  String? assetClass;
  String? absNew;
  String? xirrNew;
  String? dividendPayout;

  Msg(
      {this.invName,
        this.pan,
        this.purchaseValue,
        this.currentValue,
        this.gain,
        this.assetClass,
        this.absNew,
        this.xirrNew,
        this.dividendPayout});

  Msg.fromJson(Map<String, dynamic> json) {
    invName = json['inv_name'];
    pan = json['pan'];
    purchaseValue = json['purchasevalue'];
    currentValue = json['currentvalue'];
    gain = json['gain'];
    assetClass = json['asset_class'];
    absNew = json['abs_new'];
    xirrNew = json['xirr_new'];
    dividendPayout = json['dividend_payout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['inv_name'] = invName;
    data['pan'] = pan;
    data['purchasevalue'] = purchaseValue;
    data['currentvalue'] = currentValue;
    data['gain'] = gain;
    data['asset_class'] = assetClass;
    data['abs_new'] = absNew;
    data['xirr_new'] = xirrNew;
    data['dividend_payout'] = dividendPayout;
    return data;
  }
}