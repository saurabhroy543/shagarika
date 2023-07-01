import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controllers/total_inverstment_report_controller.dart';
import 'drawer.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class TotalInvestmentReport extends StatelessWidget {
  const TotalInvestmentReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthS = MediaQuery
        .of(context)
        .size
        .width;

    return GetBuilder<TotalInvestmentController>(
        init: TotalInvestmentController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.cyan[100],
            drawer: SideDrawer(),
            appBar: AppBar(
              title: const Text("Total Investment Report"),
              backgroundColor: Colors.cyan[700],
              elevation: 0,
              actions: [
                // GestureDetector(
                //   onTap: () {
                //     Get.to(() => const Profile(),
                //         transition: Transition.cupertino,
                //         duration: const Duration(seconds: 1));
                //   },
                //   child: const Padding(
                //     padding: EdgeInsets.only(right: 20),
                //     child: Icon(Icons.person),
                //   ),
                // )
              ],
            ),
            body: SafeArea(
              child: Padding(
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
                          //  Center(
                          //   child: Text.rich(TextSpan(children: [
                          //     const TextSpan(
                          //         text: 'Welcome ',
                          //         style: TextStyle(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w500,
                          //             color: Colors.black)),
                          //     TextSpan(
                          //         text: '${Storage.username}',
                          //         style: const TextStyle(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w600,
                          //             color: Colors.white)),
                          //   ])),
                          // ),
                          leaveCard(controller),
                          assetClassBreak(controller, context),
                          if(controller.isPopupVisible)
                          assetChart(controller, context),
                          amcClassBreak(controller, context),
                          if(controller.isAmcPopupVisible)
                          amcChart(controller, context),
                        ],
                      )),
                ),
              ),
            ),
          );
        });
  }

  Widget amcChart(TotalInvestmentController controller, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1,
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
              ElevatedButton(
                onPressed: () {
                  controller.isAmcPopupVisible = false;
                  controller.update();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text('Close'),
              ),

            ],
          )),
    );
  }

  Widget assetChart(TotalInvestmentController controller,
      BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
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
              ElevatedButton(
                onPressed: () {
                  controller.isPopupVisible = false;
                  controller.update();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text('Close'),
              ),
            ],
          )),
    );
  }

  Widget leaveCard(TotalInvestmentController controller) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Investment Summary',
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
                            return Text(controller.summaryName[index],
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
                            return Text(
                                controller.summaryAmount[index].toString(),
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

  Widget assetClassBreak(TotalInvestmentController controller,
      BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Asset wise allocation',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 15.0,
                horizontalMargin: 0.0,
                columns: [
                  const DataColumn(
                    label: Text(
                      'Asset Type',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Purchase \nValue',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Current\n Value',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 120.0,
                      // Set a fixed width for allocationPercentage column
                      child: const Text(
                        'Allo. Per(%)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
                rows: _buildRows(controller),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                controller.isPopupVisible = true;
                controller.update();
              },
              child: const Text('View Pie Chart'),
            ),
          ],
        ),
      ),
    );
  }

  List<DataRow> _buildRows(TotalInvestmentController controller) {
    final List<DataRow> rows = [];

    // Add your dynamic data here or fetch it from an API, database, etc.

    for (var data in controller.dynamicData) {
      final cells = [
        DataCell(Text(data['Asset Type']!)),
        DataCell(Text(data['Purchase Value']!)),
        DataCell(Text(data['Current Value']!)),
        DataCell(Text(data['Allo. Per(%)']!)),
      ];

      rows.add(DataRow(cells: cells));
    }

    return rows;
  }

  Widget amcClassBreak(TotalInvestmentController controller,
      BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AMC Wise Allocation',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 15.0,
                horizontalMargin: 0.0,
                columns: [
                  const DataColumn(
                    label: Text(
                      'Fund House',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Purchase \nValue',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const DataColumn(
                    label: Text(
                      'Current\n Value',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 120.0,
                      // Set a fixed width for allocationPercentage column
                      child: const Text(
                        'Allo. Per(%)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
                rows: _amcbuildRows(controller),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                controller.isAmcPopupVisible = true;
                controller.update();
              },
              child: const Text('View Pie Chart'),
            ),
          ],
        ),
      ),
    );
  }
  List<DataRow> _amcbuildRows(TotalInvestmentController controller) {
    final List<DataRow> rows = [];

    for (var data in controller.amcDynamicData) {
      final cells = [
        DataCell(Text(data['Fund House']!)),
        DataCell(Text(data['Purchase Value']!)),
        DataCell(Text(data['Current Value']!)),
        DataCell(Text(data['Allo. Per(%)']!)),
      ];

      rows.add(DataRow(cells: cells));
    }

    return rows;
  }

}
