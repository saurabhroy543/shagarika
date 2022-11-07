import 'package:get/get.dart';
import '../modules/change_password.dart';
import '../modules/dashboard.dart';
import '../modules/log.dart';
import '../modules/profile.dart';
import '../modules/splash.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const Splash()),
    GetPage(name: Routes.dashboard, page: () => const MyDashboard()),
    GetPage(name: Routes.login, page: () => const Login()),
    GetPage(name: Routes.profile, page: () => const Profile()),
    GetPage(name: Routes.changePassword, page: () => const ChangePassword()),
  ];
}
