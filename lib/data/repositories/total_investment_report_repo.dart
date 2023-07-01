import 'dart:convert';

import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/constants.dart';
import 'package:shagarika/utils/storage.dart';
import '../../utils/api_paths.dart';

import '../models/total_inverstment_report_model.dart';

class TotalInvestmentReportRepository {
  Future<TotalInvestmentReportModel> fetchTotalInvestmentReport() async {
    var body = {'pan': Storage.pan, 'arn_id': Base.arnNo};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.dataTotalInv, data: body);
    var data = json.decode(response);
    return TotalInvestmentReportModel.fromJson(data);
  }
}