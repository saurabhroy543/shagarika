import 'dart:convert';
import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/api_paths.dart';
import '../../utils/constants.dart';
import '../models/amc_deatil_model.dart';

class AmcDetailRepository {

  Future<AmcDetailModel> amcDetail(String? userId) async {
    var body = {'user_id': userId, 'arn_id': Base.arnNo};
    var response = await NetworkRequester.shared.post(
        path: ApiPaths.amcDetail, data: body);
    var data = json.decode(response);
    return AmcDetailModel.fromJson(data);
  }
}