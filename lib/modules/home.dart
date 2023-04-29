import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/modules/profile.dart';
import 'package:get/get.dart';
import 'package:shagarika/modules/purchase_request.dart';
import 'package:shagarika/modules/switch_request.dart';
import '../utils/app_pages.dart';
import 'Detail_holding report.dart';
import 'Redeemption_request.dart';
import 'SIP_request.dart';
import 'drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryGrey = Color(0xFFFFFFFF);
    // const primaryBlue = Color(0xFF0494bf);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        drawer: SideDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Dashboard"),
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const Profile(),
                    transition: Transition.cupertino,
                    duration: const Duration(seconds: 1));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: <Widget>[
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.dashboard);
                },
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              CupertinoIcons.chart_bar_square_fill,
                              size: 50,
                              semanticLabel: "Portfolio",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Portfolio',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const PurchaseRequest());
                },
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              CupertinoIcons.cart_fill,
                              size: 50,
                              semanticLabel: "Purchase Request",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Purchase Request',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const SIPrequest());
                },
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              CupertinoIcons.money_dollar_circle_fill,
                              size: 50,
                              semanticLabel: "SIP Request",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('SIP Request',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const SwitchRequest());
                },
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              Icons.currency_exchange_rounded,
                              size: 50,
                              semanticLabel: "Switch Request",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Switch Request',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const RedemptionRequest());
                },
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              Icons.card_giftcard_rounded,
                              size: 50,
                              semanticLabel: "Redemption Request",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Redemption Request',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              Icons.add_chart,
                              size: 50,
                              semanticLabel: "Total Investment Report",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Total Investment Report',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const DetailedHoldingReport());
                },
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              CupertinoIcons.chart_bar_square_fill,
                              size: 50,
                              semanticLabel: "Detail Holding Report",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Detail Holding Report',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.changePassword);
                },
                child: Container(
                  color: primaryGrey,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Icon(
                              CupertinoIcons.lock_fill,
                              size: 50,
                              semanticLabel: "Change Password",
                              color: Colors.blue,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Change Password',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
