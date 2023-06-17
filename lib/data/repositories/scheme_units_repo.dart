import 'dart:convert';
import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/constants.dart';
import '../../utils/api_paths.dart';
import '../models/scheme_units_model.dart';

class SchemeUnitsRepository {
  Future<SchemeUnitsModel> schemeUnits(String? schemeName,String pan,String folio) async {
    var body = {'pan': pan,'arn_id': Base.arnNo,'scheme_name':schemeName,'folio':folio};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.getSchemeUnits, data: body);
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$response');
    var data = json.decode(response);
    return SchemeUnitsModel.fromJson(data);
  }
}
