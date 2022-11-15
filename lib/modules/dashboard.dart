import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controllers/dashboard_controller.dart';
import 'drawer.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shagarika/utils/storage.dart';
class MyDashboard extends StatelessWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              drawer: SideDrawer(),
              appBar: AppBar(
                title: const Text("Dashboard"),
                backgroundColor: Colors.blue,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : RefreshIndicator(
                        onRefresh: () async {
                          controller.isLoading(true);
                          controller.onInit();
                          controller.update();
                          controller.isLoading(false);
                        },
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                             Center(
                              child: Text.rich(TextSpan(children: [
                                const TextSpan(
                                    text: 'Welcome ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                TextSpan(
                                    text: '${Storage.username}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue)),
                              ])),
                            ),
                            leaveCard(controller),
                            assetChart(controller, context),
                            amcChart(controller, context),
                            Row(
                              children: [
                                detailCard('No. of Active SIP', 2),
                                detailCard('Your SIP', 4000),
                              ],
                            ),
                            Row(
                              children: [
                                detailCard('Lumpsum Investment', 11999),
                              ],
                            )
                          ],
                        )),
                      ),
              ),
            ),
          );
        });
  }

  Widget amcChart(DashboardController controller, BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'AMC Wise Breakup',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 250.0,
                width: MediaQuery.of(context).size.width * 1,
                child: PieChart(
                  dataMap: controller.amcDataMap,
                  animationDuration: const Duration(milliseconds: 600),
                  chartLegendSpacing: 30,
                  colorList: controller.colorList,
                  initialAngleInDegree: 10,
                  chartRadius: 100,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 40,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.bottom,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    chartValueStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.transparent,
                        fontSize: 10,
                        color: Colors.black),
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget assetChart(DashboardController controller, BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Asset Class Breakup',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width * 0.8,
                child: PieChart(
                  dataMap: controller.dataMap,
                  animationDuration: const Duration(milliseconds: 600),
                  chartLegendSpacing: 20,
                  colorList: controller.colorList,
                  initialAngleInDegree: 0,
                  chartType: ChartType.disc,
                  ringStrokeWidth: 30,
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    chartValueStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                        color: Colors.black),
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget leaveCard(DashboardController controller) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Investment Summary',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.summaryName.length,
                          itemBuilder: (context, index) {
                            return  Text(controller.summaryName[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black87));
                          }),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: Get.width / 5,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.summaryAmount.length,
                          itemBuilder: (context, index) {
                            return  Text(controller.summaryAmount[index].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black87));
                          }),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget detailCard(String title, int amount) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("$amount")
            ],
          ),
        ),
      ),
    );
  }
}
