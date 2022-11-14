import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shagarika/data/repositories/user_repo.dart';
import '../../data/models/user_model.dart';
import 'package:shagarika/utils/storage.dart';

import '../../utils/Network_requester.dart';
import '../../utils/app_pages.dart';

class LoginController extends GetxController {
  String username = '';
  String password = '';
  var showPassword = true.obs;
  final userRepo = UserRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  userLogin(String usernameFilled, String password) async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Loading');
      await Future.delayed(const Duration(
        seconds: 5,
      )).then((value) => EasyLoading.dismiss());
      UserModel response = await userRepo.userLogin(usernameFilled, password);
      if (response.error_code == 0) {
        Storage.userId = response.user_detail?.userId.toString() ?? "";
        NetworkRequester.shared.prepareRequest();
        EasyLoading.dismiss();
        Get.offNamed(Routes.dashboard);
      } else {
        EasyLoading.showToast('${response.msg}');
      }
    }
  }
}