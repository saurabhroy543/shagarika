import 'package:shagarika/utils/app_pages.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:get/get.dart';

class AppUtils {
  static logout() {
    Storage.clear();
    Get.offAllNamed(Routes.login);
  }

  static bool isLoggedIn() => Storage.userId != null && Storage.userId != "";
}
