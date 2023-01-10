import '../../utils/app_pages.dart';
import '../../utils/app_utils.dart';
import 'package:get/get.dart';
import '../pincode.dart';
import '../verifyPin.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    if (AppUtils.isLoggedIn()) {
      if (AppUtils.isPinSet()) {
        Future.delayed(
          const Duration(seconds: 3),
          () => Get.off(const VerifyPin()),
        );
      } else {
        Future.delayed(
          const Duration(seconds: 3),
          () => Get.off(const SetPin()),
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(Routes.login),
      );
    }
    super.onInit();
  }
}
