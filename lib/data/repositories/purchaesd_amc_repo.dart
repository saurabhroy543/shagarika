import 'dart:convert';

import 'package:shagarika/data/models/purchased_amc_model.dart';
import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/api_paths.dart';
import 'package:shagarika/utils/constants.dart';
class PurchasedAMCRepository {
  Future<PurchasedAMCModel> getPurchasedAMC(String? pan) async {
    try {
      var body = {
        "arn_id": Base.arnNo,
        "pan": pan,
      };

      var response = await NetworkRequester.shared.post(
        path: ApiPaths.getAmcByPan,
        data: body,
      );
      var data = json.decode(response);
      return PurchasedAMCModel.fromJson(data);
    } catch (error) {
      print('Error occurred during getPurchasedAMC: $error');
      rethrow;
    }
  }
}

