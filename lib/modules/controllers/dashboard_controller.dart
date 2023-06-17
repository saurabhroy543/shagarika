import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:shagarika/data/models/amc_deatil_model.dart';
import 'package:shagarika/data/repositories/amc_detail_repo.dart';

import '../../data/models/asset_list_model.dart';
import '../../data/repositories/amc_list_repo.dart';

class DashboardController extends GetxController {
  var isLoading = true.obs;
  final amcDetailRepo = AmcDetailRepository();
  final assetDetailRepo = AssetListRepository();
  late AmcDetailModel amcModel;
  late AssetListModel assetModel;
  Map<String, double> amcDataMap={};
  List<String> summaryName = ['Current Value','Investment','Gain/Loss','Absolute Return'];
  List<dynamic> summaryAmount=[];
  Map<String, double> dataMap = {

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
    await getSummaryAmount();
    await getAssetMapData();
    update();
    isLoading(false);

    super.onInit();
  }

  Future gettAmcDetail() async {
    amcModel = await amcDetailRepo.amcDetail(Storage.userId);
    for (int i = 0; i < amcModel.msg!.amc!.length; i++) {
      amcDataMap["${amcModel.msg?.amc?[i].aMCName?.toString() ?? ''} : ${amcModel.msg?.amc?[i].amount}"] =
          amcModel.msg?.amc?[i].percentage?.toDouble() ?? 0.0;
    }
    update();
  }

  Future getAssetMapData() async {
    assetModel = await assetDetailRepo.assetList();
    for (int i = 0; i < assetModel.msg!.length; i++) {
      dataMap["${assetModel.msg![i].assetType ?? ''} : ${assetModel.msg?[i].purchaseValue}"] =
          assetModel.msg?[i].purchaseValue?.toDouble() ?? 0.0;
    }
    update();
  print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$dataMap');
  }

  Future getSummaryAmount() async {
    summaryAmount.add(amcModel.msg?.currentValue);
    summaryAmount.add(amcModel.msg?.purchaseValue);
    summaryAmount.add(amcModel.msg?.gain);
    summaryAmount.add(amcModel.msg?.abs);
    update();

  }

}
