class AMCListModel {
  List<Results>? results;

  AMCListModel({this.results});

  AMCListModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? amcName;

  Results({this.amcName});

  Results.fromJson(Map<String, dynamic> json) {
    amcName = json['amc_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amc_name'] = amcName;
    return data;
  }
}