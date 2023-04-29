import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shagarika/data/models/amc_deatil_model.dart';
import 'package:shagarika/data/repositories/amc_detail_repo.dart';
import 'package:shagarika/utils/storage.dart';

class RedeemptionController extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final amcDetailRepo = AmcDetailRepository();
  late AmcDetailModel amcModel;
  Map<String, double> amcDataMap={};

  var isLoading = true.obs;

  void Fvalidate() {
    if (formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }
  void Reset() {
    if (formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }

  var availableAmount;
  var availableUnit;
  String redeemBy = 'amount';
  String? nameId;
  List<dynamic> items = [
    {'id': 1, 'label': 'Rishi kumar'},
  ];
  var AMCId;
  List<dynamic> AMC = [
    {'id': 1, 'label': 'Target Scheme'},
  ];
  String? schemeId;
  List<dynamic> scheme = [
    {'id': 1, 'label': 'Scheme'},
  ];
  String? folioId;
  List<dynamic> folioNo = [
    {'id': 1, 'label': 'Folio Number'},
  ];
  @override
  void onInit() async {
    await gettAmcDetail();
    await getAmcMapData();
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
}
