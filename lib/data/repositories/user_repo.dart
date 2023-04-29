import 'package:shagarika/utils/Network_requester.dart';
import 'dart:convert';
import '../../utils/api_paths.dart';
import '../../utils/constants.dart';
import '../models/user_model.dart';

class UserRepository {
  Future<UserModel> userLogin(String userid, String password) async {
    var body = {'password': password, 'userid': userid, 'arn_id': Base.arnNo};
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.LoginPath, data: body);
    var data = json.decode(response);
    return UserModel.fromJson(data);
  }

  Future<EncryptModel> encrypt(String word) async {
    var body = {'data': word};
    var response = await NetworkRequester.shared.post(path: ApiPaths.encrpytData,data:body);
    var data = json.decode(response);
    return EncryptModel.fromJson(data);
  }

}
