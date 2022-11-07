import 'package:shagarika/utils/app_pages.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:get/get.dart';

class AppUtils {
  static logout() {
    Get.offAllNamed(Routes.login);
    Storage.clear();
  }

  static bool isLoggedIn() => Storage.token != null && Storage.token != "";
}
