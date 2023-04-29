import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class switchRequestController extends GetxController{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var isLoading = true.obs;


  void Fvalidate() {
    if (formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }
  var availableAmount;
  var availableUnit;
  String switchBy = "amount";
  var targetSchemeId;
  List<dynamic> targetScheme = [
    {'id': 1, 'label': 'Target Scheme'},
  ];
  String? schemeId;
  List<dynamic> scheme = [];
  String? folioId;
  List<dynamic> folioNo = [];

  @override
  void onInit() async {
    isLoading(false);
    super.onInit();
  }


}