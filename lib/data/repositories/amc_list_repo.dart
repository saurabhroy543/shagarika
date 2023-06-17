import 'dart:convert';
import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/api_paths.dart';
import '../../utils/constants.dart';
import '../models/amc_list_model.dart';
import 'package:shagarika/utils/storage.dart';

import '../models/asset_list_model.dart';

class AMCListRepository {
  Future<AMCListModel> amcList() async {
    var body = {'user_id': Storage.userId, 'arn_id': Base.arnNo};
    var response =
        await NetworkRequester.shared.post(path: ApiPaths.amcList, data: body);
    var data = json.decode(response);
    var result = {"results": data};
    return AMCListModel.fromJson(result);
  }
}

class AssetListRepository {
  Future<AssetListModel> assetList() async {
    var body = {'pan': Storage.pan, 'arn_id': Base.arnNo};
    var response =
        await NetworkRequester.shared.post(path: ApiPaths.assetList, data: body);
    var data = json.decode(response);
    return AssetListModel.fromJson(data);
  }
}
