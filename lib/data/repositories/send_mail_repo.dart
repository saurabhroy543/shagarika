import 'package:shagarika/data/models/Mail_send_modals.dart';
import 'package:shagarika/utils/Network_requester.dart';
import 'dart:convert';
import '../../utils/api_paths.dart';
import '../../utils/constants.dart';

class SendMailRepository {
  Future<SendMailModel?> sendMail(Map<String, dynamic> body) async {
    body['arn_id'] = Base.arnNo;
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.sendMail, data: body);
    var data = json.decode(response);
    return  SendMailModel.fromJson(data);

  }
}