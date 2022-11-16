import 'dart:convert';

import 'package:shagarika/utils/Network_requester.dart';
import 'package:shagarika/utils/constants.dart';
import '../../utils/api_paths.dart';

import '../models/user_details.dart';

class UserDetailRepository {
  Future<UserDetailModel> fetchDetail(String? userId) async {
    var body = {'user_id': userId, 'arn_id': Base.arnNo};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.userDetail, data: body);
    var data = json.decode(response);
    return UserDetailModel.fromJson(data);
  }
}
