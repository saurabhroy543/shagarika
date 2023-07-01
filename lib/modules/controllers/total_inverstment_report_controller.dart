import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:shagarika/data/models/amc_deatil_model.dart';
import 'package:shagarika/data/repositories/amc_detail_repo.dart';

import '../../data/models/asset_list_model.dart';
import '../../data/models/total_inverstment_report_model.dart';
import '../../data/repositories/amc_list_repo.dart';
import '../../data/repositories/total_investment_report_repo.dart';

class TotalInvestmentController extends GetxController {
  var isLoading = true.obs;
  final amcDetailRepo = AmcDetailRepository();
  final assetDetailRepo = AssetListRepository();
  final totalInvestmentRepo = TotalInvestmentReportRepository();
  late AmcDetailModel amcModel;
  late TotalInvestmentReportModel totalInvestmentModel;
  late AssetListModel assetModel;
  bool isPopupVisible = false;
  bool isAmcPopupVisible = false;

  Map<String, double> amcDataMap = {};
  List<String> summaryName = [
    'Asset Class',
    'Investment value',
    'Current value',
    'Divident Payout',
    'Gain/Loss',
    'Absolute Return(%)',
    'XIRR(%)'
  ];
  List<dynamic> summaryAmount = [];
  List<dynamic> dynamicData = [];
  List<dynamic> amcDynamicData = [];
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
      amcDataMap["${amcModel.msg?.amc?[i].aMCName?.toString() ??
          ''} : ${amcModel.msg?.amc?[i].amount}"] =
          amcModel.msg?.amc?[i].amount?.toDouble() ?? 0.0;
      amcDynamicData.add({
        'Fund House': amcModel.msg?.amc?[i].aMCName?.toString() ?? '',
        'Purchase Value': amcModel.msg?.amc?[i].amount?.toString() ?? 0.0,
        'Current Value': amcModel.msg?.amc?[i].currentValue?.toString() ?? 0.0,
        'Allo. Per(%)': amcModel.msg?.amc?[i].amount?.toString() ?? 0.0
      });
    }
    update();
    print('>>>>>>>>>>>>>>>>>>>>>>AMC data$amcDynamicData');
  }

  Future getAssetMapData() async {
    assetModel = await assetDetailRepo.assetList();
    for (int i = 0; i < assetModel.msg!.length; i++) {
      dataMap["${assetModel.msg![i].assetType ?? ''} : ${assetModel.msg?[i]
          .purchaseValue}"] =
          assetModel.msg?[i].purchaseValue?.toDouble() ?? 0.0;
      dynamicData.add({
        'Asset Type': assetModel.msg![i].assetType ?? '',
        'Purchase Value': assetModel.msg?[i].purchaseValue?.toString() ?? 0.0,
        'Current Value': assetModel.msg?[i].currentValue?.toString() ?? 0.0,
        'Allo. Per(%)': assetModel.msg?[i].allot?.toString() ?? 0.0
      },
      );
    }
    update();
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$dynamicData');
  }

  Future getSummaryAmount() async {
    totalInvestmentModel =
    await totalInvestmentRepo.fetchTotalInvestmentReport();
    summaryAmount.add(totalInvestmentModel.msg?[0].assetClass);
    summaryAmount.add(totalInvestmentModel.msg?[0].currentValue);

    summaryAmount.add(totalInvestmentModel.msg?[0].purchaseValue);
    summaryAmount.add(totalInvestmentModel.msg?[0].dividendPayout);
    summaryAmount.add(totalInvestmentModel.msg?[0].gain);
    summaryAmount.add(totalInvestmentModel.msg?[0].absNew);
    summaryAmount.add(totalInvestmentModel.msg?[0].xirrNew);
    update();
  }

}
