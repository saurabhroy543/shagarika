import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagarika/modules/Capital_Gain_Report.dart';
import 'package:shagarika/modules/Redeemption_request.dart';
import 'package:shagarika/modules/SIP_request.dart';
import 'package:shagarika/modules/purchase_request.dart';
import 'package:shagarika/modules/switch_request.dart';
import 'package:shagarika/modules/transaction_report.dart';
import '../utils/app_pages.dart';
import '../utils/app_utils.dart';
import '../utils/storage.dart';
import 'Detail_holding report.dart';
import 'controllers/dashboard_controller.dart';

class SideDrawer extends StatelessWidget {

  // final dashboardController = Get.put(DashboardController());

   SideDrawer({Key? key}) : super(key: key);

  Widget drawerOptions(
      {required Widget leading,
      required String text,
      required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(height: 40, width: 40, child: leading),
            Text(text, style: const TextStyle(fontSize: 15))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Routes.dashboard);
                      },
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.black54),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://www.whatsappimages.in/wp-content/uploads/2021/07/Top-HD-sad-quotes-for-whatsapp-status-in-hindi-Pics-Images-Download-Free.gif'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    color: Colors.blue,
                                  ),
                                  child: InkWell(
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      Get.toNamed(Routes.profile);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 180, minWidth: 100),
                                child: Text('${Storage.username}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 20.0)),
                              ),
                              const Text('',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 20.0)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black54,
                  height: 2,
                  thickness: 0.8,
                ),
                const SizedBox(
                  height: 5,
                ),
                drawerOptions(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                    text: 'Dashboard',
                    onTap: () {
                      Get.toNamed(Routes.dashboard);
                    }),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.black54,
                  height: 2,
                  thickness: 0.8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ExpansionTile(
                    expandedAlignment: Alignment.center,
                    title: const Text(
                      'Transaction Management',
                      style: TextStyle(fontSize: 15),
                    ),
                    tilePadding: const EdgeInsets.only(left: 40),
                    children: [
                      drawerOptions(
                          leading: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.blue,
                          ),
                          text: 'Purchase Request',
                          onTap: () {
                            Get.to(() => const PurchaseRequest());
                          }),
                      drawerOptions(
                          leading: const Icon(
                            Icons.attach_money_sharp,
                            color: Colors.blue,
                          ),
                          text: 'SIP Request',
                          onTap: () {
                            Get.to(() => const SIPrequest());
                          }),
                      drawerOptions(
                          leading: const Icon(
                            Icons.currency_exchange_sharp,
                            color: Colors.blue,
                          ),
                          text: 'Switch Request',
                          onTap: () {
                            Get.to(() => const SwitchRequest());
                          }),
                      drawerOptions(
                          leading: const Icon(
                            Icons.request_page_outlined,
                            color: Colors.blue,
                          ),
                          text: 'Redemption Request',
                          onTap: () {
                            Get.to(() => const RedemptionRequest());
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ExpansionTile(
                    expandedAlignment: Alignment.center,
                    title: const Text(
                      'Reports',
                      style: TextStyle(fontSize: 15),
                    ),
                    tilePadding: const EdgeInsets.only(left: 40),
                    children: [
                      drawerOptions(
                          leading: const Icon(
                            Icons.bar_chart,
                            color: Colors.blue,
                          ),
                          text: 'Total Investment Report',
                          onTap: () {
                            // Get.to(() => LeaveBalanceView());
                          }),
                      drawerOptions(
                          leading: const Icon(
                            Icons.account_balance_sharp,
                            color: Colors.blue,
                          ),
                          text: 'Capital Gain Report',
                          onTap: () {
                            Get.off(() => const CapitalGainReport());
                          }),
                      drawerOptions(
                          leading: const Icon(
                            Icons.balance_rounded,
                            color: Colors.blue,
                          ),
                          text: 'Detail Holding Report',
                          onTap: () {
                            Get.to(() => const DetailedHoldingReport());
                             Get.back();
                          }),
                      drawerOptions(
                          leading:
                              const Icon(Icons.assignment, color: Colors.blue),
                          text: 'Transaction Report',
                          onTap: () {
                            Get.to(() => const TransactionReport());
                          }),
                      drawerOptions(
                          leading: const Icon(
                            Icons.request_page_outlined,
                            color: Colors.blue,
                          ),
                          text: 'Active SIP Report',
                          onTap: () {
                            // Get.to(() => ActiveSipReport());
                            Get.back();
                          }),
                    ],
                  ),
                ),
                drawerOptions(
                    leading: const Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    text: 'Change Password',
                    onTap: () {
                      Get.toNamed(Routes.changePassword);
                    }),
                const SizedBox(
                  height: 5,
                ),
                drawerOptions(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    text: 'Logout',
                    onTap: () {
                      AppUtils.logout();
                      // Get.back();
                      Get.offAllNamed(Routes.login);
                    }
                    ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
