import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shagarika/data/models/scheme_by_amc_model.dart';
import 'package:shagarika/data/repositories/purchaesd_amc_repo.dart';
import 'package:shagarika/data/repositories/scheme_by_amc_repo.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shagarika/data/repositories/folio_repo.dart';
import 'package:shagarika/data/models/folio_model.dart';
import 'package:shagarika/data/repositories/send_mail_repo.dart';

import '../../data/models/Mail_send_modals.dart';
import '../../data/models/purchased_amc_model.dart';
import '../../data/models/scheme_units_model.dart';
import '../../data/repositories/scheme_units_repo.dart';
import '../../utils/app_pages.dart';

class RedeemptionController extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final amcDetailRepo = PurchasedAMCRepository();
  final schemeByAmcRepo = SchemeByAmcRepository();
  final folioRepo = FolioRepository();
  final schemeUnitsRepo = SchemeUnitsRepository();
  final sendMailRepo = SendMailRepository();

  late PurchasedAMCModel amcModel;
  late PurchasedSchemeByAMCModel schemeByAmcModel;
  late FolioModel folioModel;
  late SchemeUnitsModel schemeUnitsModel;
  late SendMailModel SendMail;

  List amcDataMap = [];

  var isLoading = true.obs;
  double? availableAmount=0;
  var availableUnit;
  String redeemBy = 'amount';
  String? nameId;

  List<dynamic> items = [
    {'id': 1, 'label': 'Rishi kumar'},
  ];
  var AMCId;
  var AMC_name;
  List<dynamic> AMC = [];

  String? schemeId;
  List<dynamic> scheme = [];

  String? folioId;
  List<dynamic> folioNo = [];

  bool showCalculatedSwitchAmount = false;
  bool showUnitAmountTextBox = true;
  var pur_value;
  var totalValue = '0';
  String value = "Amount";


  @override
  void onInit() async {
    await getAmcDetail();
    update();
    isLoading(false);
    super.onInit();
  }
  Future<void> formValidate() async {
    EasyLoading.show(status: 'Loading');

    final isValid = formkey.currentState!.validate();
    if (isValid) {
      final request = {
        "scheme_name": schemeId,
        "folio": folioId,
        "type":'redeem',
        "clientpan": Storage.pan,
        "amc": AMC_name,
        "cal_amt_switch": totalValue,
        "available_amount": availableAmount,
        "available_units": availableUnit,
      };
      print(request);
      // if (redeemBy=='amount'){
      //   request['amount_switch'] = amount;
      // }else if (redeemBy=='unit'){
      //   request['units_switch'] = amount;
      // }

      SendMail = (await sendMailRepo.sendMail(request))!;
      EasyLoading.showToast(SendMail.msg!);
      Get.offAllNamed(Routes.home);
    } else {
      // Handle case when form is not valid
      EasyLoading.showToast('Invalid form. Please check your inputs.');
    }
  }

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

  Future getAmcDetail() async {
    amcModel = await amcDetailRepo.getPurchasedAMC(Storage.pan);
    for (int i = 0; i < amcModel.msg!.length; i++) {
      AMC.add({'id':i,'amc_code': amcModel.msg![i].id, 'label': amcModel.msg![i].amcName});
    }
    update();
  }

  Future getTargetScheme(String amcCode) async{
    EasyLoading.show(status: 'Loading');
    scheme = [];
    folioNo =[];
    availableAmount =0;
    availableUnit = '0';
    schemeByAmcModel = await schemeByAmcRepo.getSchemeByAmc(amcCode, Storage.pan);
    for(int i=0; i<schemeByAmcModel.result!.length;i++){
      scheme.add({'id': i, 'label': schemeByAmcModel.result![i].schemeName});
    }
    update();
    EasyLoading.dismiss();

  }

  Future getFolio(schemeName,) async {
    EasyLoading.show(status: 'Loading');
    folioNo =[];
    folioModel = await folioRepo.folioName(schemeName, Storage.pan!);
    for (int i = 0; i < folioModel.msg!.length; i++) {
      folioNo.add({'id': i, 'label': folioModel.msg?[i].folioNo});
      update();
      EasyLoading.dismiss();
    }
  }
  Future getSchemeUnits(schemeName,folio) async {
    EasyLoading.show(status: 'Loading');
    schemeUnitsModel = await schemeUnitsRepo.schemeUnits(schemeName, Storage.pan!,folio);
    availableAmount = schemeUnitsModel.msg![0].availableAmount;
    availableUnit = schemeUnitsModel.msg![0].units;
    // amc =schemeUnitsModel.msg![0].amcCode;
    pur_value=schemeUnitsModel.msg![0].purPrice;
    update();
    EasyLoading.dismiss();
  }
  void calculateTotalValue(unit){
    double result = (double.parse(unit ?? "") * double.parse(pur_value ?? ""));
    String formattedResult = result.toStringAsFixed(3);
    totalValue = formattedResult;
    update();
    print('Formatted result: ${totalValue}');
    print('Formatted result: ${availableUnit.runtimeType}');
  }

}
