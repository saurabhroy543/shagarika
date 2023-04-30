import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shagarika/data/models/Mail_send_modals.dart';
import 'package:shagarika/data/models/folio_model.dart';
import 'package:shagarika/data/repositories/amc_list_repo.dart';
import 'package:shagarika/data/repositories/send_mail_repo.dart';
import 'package:shagarika/utils/app_pages.dart';
import '../../data/models/amc_list_model.dart';
import 'package:shagarika/utils/storage.dart';
import '../../data/models/schemeDetail_model.dart';
import '../../data/models/scheme_list_model.dart';
import '../../data/models/user_details.dart';
import '../../data/repositories/folio_repo.dart';
import '../../data/repositories/schemeDetail_repo.dart';
import '../../data/repositories/scheme_list_repo.dart';
import '../../data/repositories/user_detail_repo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class PurchaseRequestController extends GetxController {
  var isLoading = true.obs;
  final amcListRepo = AMCListRepository();
  final schemeDetailRepo = SchemeDetailRepository();
  final schemeListRepo = SchemeListRepository();
  final userDetailRepo = UserDetailRepository();
  final foliolRepo = FolioRepository();
  final sendMailRepo = SendMailRepository();
  late UserDetailModel userDetailModel;
  late FolioModel folioModel;
  late AMCListModel amcListModel;
  late SchemeDetailModel schemeDetailModel;
  late SchemeModel schemeListModel;
  late SendMailModel SendMail;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> Fvalidate()  async {
    if (formkey.currentState!.validate()) {
      EasyLoading.show(status: 'Loading');
      var request = {
        "type":'purchase',
        "clientpan": Storage.pan,
        "amc": amcId,
        "folio": folioId,
        "amt_inve": amount,
        "dividend": "dividend payout",
        "scheme_name": schemeName,
        "min_amt":minimumPurchase,
        "ad_min_amt":minimumAdditionalPurchase,
      };
      isLoading(true);
      SendMail = (await sendMailRepo.sendMail(request))!;
      EasyLoading.showToast(SendMail.msg!);
      Get.offAllNamed(Routes.home);
    } else {
      print('>>>>>>>>>>>>>>>>>>>>>>>>>error');
      EasyLoading.showToast('Something Went Wrong ! Please try later',
        duration: const Duration(seconds: 3),);

    }
  }

  var minimumPurchase = "00";
  var minimumAdditionalPurchase = '00';
  var amount = 00;
  var amcId;
  List<dynamic> amc = [];
  int? schemeId;
  String? schemeName;
  List<dynamic> scheme = [];
  String? folioId;
  List<dynamic> folioNo = [];

  void Reset() {
    scheme = [];
    folioNo = [];
    minimumPurchase = "00";
    minimumAdditionalPurchase = "00";
    amount = 0;
    update();
  }

  @override
  void onInit() async {
    await getamcList();
    update();
    isLoading(false);
    super.onInit();
  }

  Future getamcList() async {
    amcListModel = await amcListRepo.amcList();
    for (int i = 0; i < amcListModel.results!.length; i++) {
      amc.add({'id': i, 'label1': amcListModel.results?[i].amcName});
    }
    update();
  }

  Future getschemelist(String amcName) async {
    EasyLoading.show(status: 'Loading');
    scheme = [];
    schemeListModel = await schemeListRepo.schemeList(amcName);
    for (int i = 0; i < schemeListModel.results!.length; i++) {
      scheme.add({
        'id': i,
        'label': schemeListModel.results?[i].schName,
        'scheme_id': schemeListModel.results?[i].id
      });
    }
    update();
    EasyLoading.dismiss();

  }

  Future getschemedetail(
      String amcName, int schemeId, String schemeName) async {
    EasyLoading.show(status: 'Loading');
    minimumPurchase = "00";
    folioNo = [];
    minimumAdditionalPurchase = '00';
    schemeDetailModel = await schemeDetailRepo.schemeDetail(amcName, schemeId);
    minimumPurchase = schemeDetailModel.result![0].purchaseAmount!;
    minimumAdditionalPurchase = schemeDetailModel.result![0].addPurchaseAmt!;
    userDetailModel = await userDetailRepo.fetchProfileDetail(Storage.userId);
    var pan = userDetailModel.msg!.panNo!;
    folioModel = await foliolRepo.folioName(schemeName, schemeId, pan);
    for (int i = 0; i < folioModel.msg!.length; i++) {
      folioNo.add({'id': i, 'label': folioModel.msg?[i].folioNo});
    }
    folioNo.add({'id': folioNo.length, 'label': "New Folio Number"});
    update();
    EasyLoading.dismiss();

  }
}
