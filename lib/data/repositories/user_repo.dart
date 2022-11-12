import 'package:shagarika/utils/Network_requester.dart';
import 'dart:convert';
import '../../utils/api_paths.dart';
import '../models/user_model.dart';

class UserRepository {
  Future<UserModel> userLogin(String userid, String password) async {
    var body = {'password': password, 'userid': userid, 'arn_id': 104069};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.LoginPath, data: body);
    var nefw = json.decode(response);
    print('$nefw hehehehe3oi4t9835utv98p3tn9p3 u58u24m98wu8m5u88888888888888888888888888888888888888888888888888888');
    print('$response????????????????????????????????/////////////////////////////////////////');
    print('${nefw.runtimeType} helololololol)))))))))))))))))))))))))))))))?????????????????????????????????????');
    print('jbfksbvkwbshelololololololkjvsbks ${UserModel.fromJson(nefw)}');
    return UserModel.fromJson(nefw);
  }
}
