class PurchasedSchemeModel {
  List<Result>? result;

  PurchasedSchemeModel({this.result});

  PurchasedSchemeModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? schemeName;

  Result({this.id, this.schemeName});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schemeName = json['scheme_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['scheme_name'] = schemeName;
    return data;
  }
}