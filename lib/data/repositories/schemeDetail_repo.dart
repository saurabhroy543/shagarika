
import 'dart:convert';

import 'package:shagarika/utils/storage.dart';

import '../../utils/Network_requester.dart';
import '../../utils/api_paths.dart';
import '../../utils/constants.dart';
import '../models/schemeDetail_model.dart';

class SchemeDetailRepository{
  Future<SchemeDetailModel>schemeDetail(String amcName,int schemeId) async {
    var body = {
      "user_id": Storage.userId,
      "arn_id": Base.arnNo,
      "amc_name": amcName,
      "report": "purchase",
      "scheme_id":schemeId
    };
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.schemeList, data: body);
    var data = json.decode(response);
    var result = {"result": data};
    return SchemeDetailModel.fromJson(result);
  }
}