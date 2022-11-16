import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:shagarika/data/models/amc_deatil_model.dart';
import 'package:shagarika/data/repositories/amc_detail_repo.dart';

class DashboardController extends GetxController {
  var isLoading = true.obs;
  final amcDetailRepo = AmcDetailRepository();
  late AmcDetailModel amcModel;
  Map<String, double> amcDataMap={};
  List<String> summaryName = ['Current Value','Investment','Gain/Loss','Absolute Return'];
  List<dynamic> summaryAmount=[];
  Map<String, double> dataMap = {
    "Present:20.0": 20,
    "Absent: 30": 30,
    "Leave: 40": 40,
    "Holiday: 50": 50,
    "On Duty : 20": 20,
  };
  List<Color> colorList = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.green
  ];

  @override
  void onInit() async {
    await gettAmcDetail();
    await getAmcMapData();
    await getSummaryAmount();
    update();
    isLoading(false);
    super.onInit();
  }

  Future gettAmcDetail() async {
    amcModel = await amcDetailRepo.amcDetail(Storage.userId);
    update();
  }

  Future getAmcMapData() async {
    for (int i = 0; i < amcModel.msg!.amc!.length; i++) {
      amcDataMap["${amcModel.msg?.amc?[i].aMCName?.toString() ?? ''} : ${amcModel.msg?.amc?[i].amount}"] =
          amcModel.msg?.amc?[i].percentage?.toDouble() ?? 0.0;
    }
    update();

  }

  Future getSummaryAmount() async {
    summaryAmount.add(amcModel.msg?.currentValue);
    summaryAmount.add(amcModel.msg?.purchaseValue);
    summaryAmount.add(amcModel.msg?.gain);
    summaryAmount.add(amcModel.msg?.abs);
    update();

  }

}
