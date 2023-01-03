class SchemeModel {
  List<Results>? results;

  SchemeModel({this.results});

  SchemeModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? schName;

  Results({this.id, this.schName});

  Results.fromJson(Map<String, dynamic> json) {
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