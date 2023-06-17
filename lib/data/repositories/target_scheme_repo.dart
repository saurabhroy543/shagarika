import 'dart:convert';
import 'package:shagarika/data/models/target_scheme.dart';
import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/constants.dart';
import '../../utils/api_paths.dart';

class TargetSchemeRepository {
  Future<TargetSchemeModel> targetScheme(String? schemeName,String pan) async {
    var body = {'pan': pan,'arn_id': Base.arnNo,'scheme_name':schemeName};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.targetedScheme, data: body);
    var data = json.decode(response);
    return TargetSchemeModel.fromJson(data);
  }
}
