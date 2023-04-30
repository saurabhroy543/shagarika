import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shagarika/utils/storage.dart';
import '../../data/models/amc_list_model.dart';
import '../../data/models/folio_model.dart';
import '../../data/models/schemeDetail_model.dart';
import '../../data/models/scheme_list_model.dart';
import '../../data/models/user_details.dart';
import '../../data/repositories/amc_list_repo.dart';
import '../../data/repositories/folio_repo.dart';
import '../../data/repositories/schemeDetail_repo.dart';
import '../../data/repositories/scheme_list_repo.dart';
import '../../data/repositories/user_detail_repo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shagarika/data/repositories/send_mail_repo.dart';
import 'package:shagarika/data/models/Mail_send_modals.dart';
import 'package:shagarika/utils/app_pages.dart';





class SipRequestController extends GetxController {
  var isLoading = true.obs;
  final amcListRepo = AMCListRepository();
  late UserDetailModel userDetailModel;
  final userDetailRepo = UserDetailRepository();
  final folioRepo = FolioRepository();
  late FolioModel folioModel;
  late SendMailModel SendMail;

  final schemeListRepo = SchemeListRepository();
  late AMCListModel amcListModel;
  late SchemeModel schemeListModel;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late SchemeDetailModel schemeDetailModel;
  final schemeDetailRepo = SchemeDetailRepository();
  final sendMailRepo = SendMailRepository();


  var fromDate = DateTime.now();
  var toDate = DateTime.now();
  bool perpetualSIP = false;
  var amcId;
  List<dynamic> amc = [];
  int? schemeId;
  String? schemeName;
  List<dynamic> scheme = [];
  String? folioId;
  List<dynamic> folioNo = [];
  String? SIPTypeId;
  List<dynamic> SIPType = [
    {'id': 0, 'label': "SIP With NACH(xSIP)"},
    {'id': 1, 'label': "SIP With URN(iSIP)"}
  ];
  String? dividendId;
  List<dynamic> dividend = [
    {'id': 0, 'label': 'Dividend Payout'},
    {'id': 1, 'label': 'Dividend Re-Investment'},
  ];
  var amount = 00;

  @override
  void onInit() async {
    await getamcList();
    update();
    isLoading(false);
    super.onInit();
  }

  getDate(String date) {
    DateTime res = DateTime.parse(date);
    update();
    return DateFormat('dd-MM-yyy').format(res).toString();
  }

  Future<void> formValidate() async {
    if (!formkey.currentState!.validate()) {
    } else {
      EasyLoading.show(status: 'Loading');
      schemeDetailModel = await schemeDetailRepo.schemeDetail(amcId, schemeId!);
      var sipdates = schemeDetailModel.result![0].sipDates;
      sipdates ??= "Date not available";
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${sipdates.runtimeType}');
      var request = {
        "type":'sip',
        "clientpan": Storage.pan,
        "amc": amcId,
        "scheme_name": schemeName,
        "folio": folioId,
        "dividend": dividendId,
        "amt_inve": amount,
        "sip_type": SIPTypeId,
        "start_date": fromDate,
        "end_date": toDate,
        "al_sip_dates": sipdates
      };
      SendMail = (await sendMailRepo.sendMail(request))!;
      EasyLoading.showToast(SendMail.msg!);
      Get.offAllNamed(Routes.home);
    }
  }

  void Reset() {
    amcId=null;
    scheme = [];
    folioNo = [];
    amount = 0;
    update();
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

  Future getFolio(int schemeId, String schemeName) async {
    EasyLoading.show(status: 'Loading');
    folioNo = [];
    folioModel = await folioRepo.folioName(schemeName, schemeId,Storage.pan!);
    for (int i = 0; i < folioModel.msg!.length; i++) {
      folioNo.add({'id': i, 'label': folioModel.msg?[i].folioNo});
    }
    update();
    EasyLoading.dismiss();
  }
}
