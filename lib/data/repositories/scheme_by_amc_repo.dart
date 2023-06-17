import 'package:shagarika/utils/Network_requester.dart';
import 'dart:convert';
import '../../utils/api_paths.dart';
import '../../utils/constants.dart';
import '../models/scheme_by_amc_model.dart';

class SchemeByAmcRepository {
  Future<PurchasedSchemeByAMCModel> getSchemeByAmc(String amc_code,
      String? pan) async {
    try {
      var body = {
        "arn_id": Base.arnNo,
        "pan": pan,
      };

      var response = await NetworkRequester.shared.post(
          path: ApiPaths.getSchemeByAmc, data: body);
      var data = json.decode(response);
      var result = {'result':data};
      return PurchasedSchemeByAMCModel.fromJson(result);
    }
    catch (error) {
      print('Error occurred during getPurchasedAMC: $error');
      rethrow;
    }

  }
}