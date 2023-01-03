import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/modules/profile.dart';
import 'package:get/get.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryGrey = Color(0xFFe3e4db);
    const primaryBlue = Color(0xFF0494bf);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: SideDrawer(),
        appBar: AppBar(
          title: const Text("Dashboard"),
          backgroundColor: Colors.blue,
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
          child: Column(
            children: [
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: primaryGrey,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Icon(
                                  CupertinoIcons.chart_bar_square_fill,
                                  size: 50,
                                  semanticLabel: "Portfolio",
                                  color: primaryBlue,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Portfolio'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: primaryGrey,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Icon(
                                  CupertinoIcons.cart_fill,
                                  size: 50,
                                  semanticLabel: "Purchase Request",
                                  color: primaryBlue,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Purchase Request'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: primaryGrey,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Icon(
                                  CupertinoIcons.money_dollar_circle_fill,
                                  size: 50,
                                  semanticLabel: "SIP Request",
                                  color: Colors.blueGrey,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('SIP Request'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: primaryGrey,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Icon(
                                  Icons.currency_exchange_rounded,
                                  size: 50,
                                  semanticLabel: "Switch Request",
                                  color: Colors.blueGrey,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Switch Request'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: primaryGrey,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Icon(
                                  Icons.card_giftcard_rounded,
                                  size: 50,
                                  semanticLabel: "Redemption Request",
                                  color: Colors.blueGrey,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Redemption Request'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: primaryGrey,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Icon(
                                  CupertinoIcons.chart_bar_square_fill,
                                  size: 50,
                                  semanticLabel: "Portfolio",
                                  color: Colors.blueGrey,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Portfolio'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Expanded(
              //     child: Align(
              //         alignment: Alignment.bottomCenter,
              //         child: Container(
              //           color: Colors.blueGrey,
              //           height: 70,
              //           child: Row(
              //             children: [
              //               const SizedBox(
              //                 width: 30,
              //               ),
              //               Column(
              //                 children: const [
              //                   SizedBox(
              //                     height: 10,
              //                   ),
              //                   Text('Invested'),
              //                   Text(
              //                     '₹ 20,000',
              //                     style: TextStyle(fontWeight: FontWeight.bold),
              //                   )
              //                 ],
              //               ),
              //               const SizedBox(
              //                 width: 35,
              //               ),
              //               const VerticalDivider(
              //                 color: Colors.white,
              //                 width: 1,
              //                 thickness: 0.8,
              //                 indent: 9,
              //                 endIndent: 9,
              //               ),
              //               const SizedBox(
              //                 width: 30,
              //               ),
              //               Column(
              //                 children: const [
              //                   SizedBox(
              //                     height: 10,
              //                   ),
              //                   Text('Invested'),
              //                   Text(
              //                     '₹1500',
              //                     style: TextStyle(fontWeight: FontWeight.bold),
              //                   )
              //                 ],
              //               ),
              //               const SizedBox(
              //                 width: 35,
              //               ),
              //               const VerticalDivider(
              //                 color: Colors.white,
              //                 width: 1,
              //                 thickness: 0.8,
              //                 indent: 9,
              //                 endIndent: 9,
              //               ),
              //               const SizedBox(
              //                 width: 30,
              //               ),
              //               Column(
              //                 children: const [
              //                   SizedBox(
              //                     height: 10,
              //                   ),
              //                   Text('Invested'),
              //                   Text(
              //                     '₹ 4653',
              //                     style: TextStyle(fontWeight: FontWeight.bold),
              //                   )
              //                 ],
              //               ),
              //             ],
              //           ),
              //         )))
            ],
          ),
        ),
      ),
    );
  }
}
