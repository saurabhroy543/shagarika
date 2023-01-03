import 'dart:convert';

import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/api_paths.dart';
import 'package:shagarika/utils/constants.dart';
import 'package:shagarika/utils/storage.dart';
import '../models/scheme_list_model.dart';

class SchemeListRepository {
  Future<SchemeModel> schemeList(String? amcName) async {
    var body = {
      'user_id': Storage.userId,
      'arn_id': Base.arnNo,
      "amc_name": amcName,
      "report": "purchase"
    };
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.schemeList, data: body);
    var data = json.decode(response);
    var result = {"results": data};
    return SchemeModel.fromJson(result);
  }
}
