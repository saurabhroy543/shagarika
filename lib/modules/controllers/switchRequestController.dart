import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shagarika/data/models/Purchased_scheme_model.dart';
import 'package:shagarika/data/models/folio_model.dart';
import 'package:shagarika/data/models/scheme_units_model.dart';
import 'package:shagarika/data/models/target_scheme.dart';
import 'package:shagarika/data/repositories/folio_repo.dart';
import 'package:shagarika/data/repositories/scheme_list_repo.dart';
import 'package:shagarika/data/repositories/target_scheme_repo.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shagarika/data/repositories/send_mail_repo.dart';

import '../../data/models/Mail_send_modals.dart';
import '../../data/repositories/scheme_units_repo.dart';
import '../../utils/app_pages.dart';


class switchRequestController extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late PurchasedSchemeModel purchasedScheme;
  late TargetSchemeModel targetSchemeModel;
  late SchemeUnitsModel schemeUnitsModel;
  late FolioModel folioModel;
  late SendMailModel SendMail;

  final schemeListRepo = SchemeListRepository();
  final folioRepo = FolioRepository();
  final targetSchemeRepo = TargetSchemeRepository();
  final schemeUnitsRepo = SchemeUnitsRepository();
  final sendMailRepo = SendMailRepository();

  var isLoading = true.obs;
  double? availableAmount=0.0;
  String ? availableUnit = '0';
  var amount;
  String switchBy = "amount";
  String value = "Amount";
  var targetSchemeId;
  List<dynamic> targetScheme = [];
  String? schemeId;
  String? schemeName;
  List<dynamic> scheme = [];

  String? folioId;
  List<dynamic> folioNo = [];

  var amc ;
  bool showCalculatedSwitchAmount = false;
  bool showUnitAmountTextBox = true;
  var pur_value;
  var totalValue = '0';


  @override
  void onInit() async {
    await getschemelist();
    update();
    isLoading(false);
    super.onInit();
  }


  Future getschemelist() async {
    scheme = [];
    purchasedScheme = await schemeListRepo.purchasedScheme();
    for (int i = 0; i < purchasedScheme.result!.length; i++) {
      scheme.add({
        'id': i,
        'label': purchasedScheme.result?[i].schemeName,
        'scheme_id': purchasedScheme.result?[i].id
      });
    }
    update();
  }
  Future<void> formValidate() async {
    EasyLoading.show(status: 'Loading');

    final isValid = formkey.currentState!.validate();
    if (isValid) {
      final request = {
        "scheme_name": schemeName,
        "folio": folioId,
        "type":'switch',
        "clientpan": Storage.pan,
        "amc": amc,
        "cal_amt_switch": totalValue,
        "available_amount": availableAmount,
        "available_units": availableUnit,
        "target_scheme": targetSchemeId,
      };
      if (switchBy=='amount'){
        request['amount_switch'] = amount;
      }else if (switchBy=='unit'){
        request['units_switch'] = amount;
      }

      SendMail = (await sendMailRepo.sendMail(request))!;
      EasyLoading.showToast(SendMail.msg!);
      Get.offAllNamed(Routes.home);
    } else {
      // Handle case when form is not valid
      EasyLoading.showToast('You have entered Wrong data.');
    }
  }

  void reset() {
    scheme = [];
    folioNo = [];
    update();
  }

  Future getFolio(schemeName,) async {
    EasyLoading.show(status: 'Loading');
    folioModel = await folioRepo.folioName(schemeName, Storage.pan!);
    for (int i = 0; i < folioModel.msg!.length; i++) {
      folioNo.add({'id': i, 'label': folioModel.msg?[i].folioNo});
    }
    targetSchemeModel =
    await targetSchemeRepo.targetScheme(schemeName, Storage.pan!);
    for (int i = 0; i < targetSchemeModel.msg!.length; i++) {
      targetScheme.add({'id': i, 'label': targetSchemeModel.msg?[i].schName});
    }
    update();
    EasyLoading.dismiss();
  }

  Future getSchemeUnits(schemeName,folio) async {
    EasyLoading.show(status: 'Loading');
    schemeUnitsModel = await schemeUnitsRepo.schemeUnits(schemeName, Storage.pan!,folio);
      availableAmount = schemeUnitsModel.msg![0].availableAmount;
      availableUnit = schemeUnitsModel.msg![0].units;
      amc =schemeUnitsModel.msg![0].amcCode;
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