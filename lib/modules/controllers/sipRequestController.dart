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

class SipRequestController extends GetxController {
  var isLoading = true.obs;
  final amcListRepo = AMCListRepository();
  late UserDetailModel userDetailModel;
  final userDetailRepo = UserDetailRepository();
  final foliolRepo = FolioRepository();
  late FolioModel folioModel;

  final schemeListRepo = SchemeListRepository();
  late AMCListModel amcListModel;
  late SchemeModel schemeListModel;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late SchemeDetailModel schemeDetailModel;
  final schemeDetailRepo = SchemeDetailRepository();

  void formValidate() {
    if (!formkey.currentState!.validate()) {
    }
    else{
      var request = {
        "client name": Storage.username,
        "amc": amcId,
        "scheme": schemeId,
        "floio Number": folioId,
        "amount": amount,
        "SIPTypeId": SIPTypeId,
        "dividendId": dividendId,
        "fromDate": fromDate,
        "toDate": toDate,
        "perpetualSIP": perpetualSIP
      };
      print(request);

    }
  }
  void Reset() {
    scheme = [];
    folioNo = [];
    amount = 0;
    update();
  }
  void valid() {
    scheme = [];
    folioNo = [];
    amount = 0;
    update();
  }

  var dateto = '';
  var fromDate = DateTime.now();
  var toDate = DateTime.now();
  bool perpetualSIP = false;

  getDate(String date) {
    DateTime res = DateTime.parse(date);
    update();
    return DateFormat('dd-MM-yyy').format(res).toString();
  }

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
    {'id': 1, 'label': 'Dividend Payout'},
    {'id': 2, 'label': 'Dividend Re-Investment'},
  ];
  var amount = 00;

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
  }

  Future getschemedetail(
      String amcName, int schemeId, String schemeName) async {
    folioNo = [];
    userDetailModel = await userDetailRepo.fetchProfileDetail(Storage.userId);
    var pan = userDetailModel.msg!.panNo!;
    folioModel = await foliolRepo.folioName(schemeName, schemeId, pan);
    for (int i = 0; i < folioModel.msg!.length; i++) {
      folioNo.add({'id': i, 'label': folioModel.msg?[i].folioNo});
    }
    folioNo.add({'id': folioNo.length, 'label': "New Folio Number"});
    update();
  }
}
