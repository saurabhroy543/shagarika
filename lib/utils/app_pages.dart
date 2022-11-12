import 'package:get/get.dart';
import 'package:shagarika/modules/Capital_Gain_Report.dart';
import 'package:shagarika/modules/SIP_request.dart';
import 'package:shagarika/modules/purchase_request.dart';
import 'package:shagarika/modules/switch_request.dart';
import 'package:shagarika/modules/transaction_report.dart';
import '../modules/Redeemption_request.dart';
import '../modules/change_password.dart';
import '../modules/dashboard.dart';
import '../modules/log.dart';
import '../modules/profile.dart';
import '../modules/splash.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const Splash()),
    GetPage(name: Routes.dashboard, page: () => const MyDashboard(),transition: Transition.fadeIn,transitionDuration: const Duration(seconds: 1)),
    GetPage(name: Routes.login, page: () => const Login(),transition: Transition.fade,transitionDuration: const Duration(seconds: 1)),
    GetPage(name: Routes.profile, page: () => const Profile()),
    GetPage(name: Routes.changePassword, page: () => const ChangePassword()),
    GetPage(name: Routes.purchaseRequest, page:() => const PurchaseRequest()),
    GetPage(name: Routes.capitalGain, page:() => const CapitalGainReport()),
    GetPage(name: Routes.transactionReport, page:() => const TransactionReport()),
    GetPage(name: Routes.sipRequest, page:() => const SIPrequest()),
    GetPage(name: Routes.switchRequest, page:() => const SwitchRequest()),
    GetPage(name: Routes.redeemRequest, page:() => const RedemptionRequest()),
    GetPage(name: Routes.redeemRequest, page:() => const RedemptionRequest()),
  ];
}
