import 'dart:convert';
import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/api_paths.dart';

import '../../utils/constants.dart';
import '../models/folio_model.dart';

class FolioRepository {
  Future<FolioModel> folioName(
      String schemeName, String pan) async {
    var body = {
      "arn_id": Base.arnNo,
      "scheme_name": schemeName,
      "pan": pan,
      // "scheme_id": schemeId
    };
    var response =
        await NetworkRequester.shared.post(path: ApiPaths.folio, data: body);
    var data = json.decode(response);
    print(data);
    return FolioModel.fromJson(data);
  }
}
