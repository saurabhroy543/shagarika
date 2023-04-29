import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:get/get.dart';

import 'controllers/purchase_request_controller.dart';
import 'drawer.dart';

class PurchaseRequest extends StatelessWidget {
  const PurchaseRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseRequestController>(
      init: PurchaseRequestController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.cyan[100],
            appBar: AppBar(
              title: const Text("Purchase Request"),
              backgroundColor: Colors.cyan[700],
            ),
            drawer: SideDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        controller.isLoading(true);
                        controller.onInit();
                        controller.update();
                        controller.isLoading(false);
                      },
                      child: Card(child: _uiWidget(controller, context)),
                    ),
            ));
      },
    );
  }

  Widget _uiWidget(controller, context) {
    return Form(
      key: controller.formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: const [
                    Text(
                      'Client Name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: Storage.username,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "AMC",
                "Select AMC",
                controller.amcId,
                controller.amc,
                (onChanged) {
                  var data = controller.amc[int.parse(onChanged)];
                  controller.isLoading(true);
                  controller.amcId = data['label1'];
                  controller.getschemelist(data['label1']);
                  controller.update();
                  controller.isLoading(false);
                },
                (onValidate) {
                  if (onValidate == null) {
                    return "please Select AMC";
                  }
                },
                optionLabel: 'label1',
                borderColor: Colors.black,
                borderFocusColor: Colors.black,
                borderRadius: 5,
                paddingLeft: 0,
                paddingRight: 0,
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Select Scheme",
                "Select Scheme",
                controller.schemeId,
                controller.scheme,
                (onChanged) {
                  var data = controller.scheme[int.parse(onChanged)];
                  controller.isLoading(true);
                  controller.schemeId = int.parse(data['scheme_id']);
                  controller.schemeName = data['label'];
                  controller.getschemedetail(controller.amcId,
                      controller.schemeId, controller.schemeName);
                  controller.update();
                  controller.isLoading(false);
                },
                (onValidate) {
                  if (onValidate == Null) {
                    return "please Select Scheme";
                  }
                },
                optionLabel: 'label',
                optionValue: 'id',
                borderColor: Colors.black,
                borderFocusColor: Colors.black,
                borderRadius: 5,
                paddingLeft: 0,
                paddingRight: 0,
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Folio Number",
                "Select Folio Number",
                controller.folioId,
                controller.folioNo,
                (onChanged) {
                  var data = controller.folioNo[int.parse(onChanged)];
                  controller.folioId = data['label'];
                  controller.update();
                },
                (onValidate) {
                  if (onValidate == Null) {
                    return "please select Folio Number";
                  }
                },
                optionLabel: 'label',
                optionValue: 'id',
                borderColor: Colors.black,
                borderFocusColor: Colors.black,
                borderRadius: 5,
                paddingLeft: 0,
                paddingRight: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: const [
                    Text(
                      'Min Purchase Amount',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: controller.minimumPurchase,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: const [
                    Text(
                      'Min Additional Purchase Amount',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: controller.minimumAdditionalPurchase,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "Amount To be Invested",
                "Amount To be Invested",
                "00",
                (onValidate) {
                  if (onValidate.isEmpty) {
                    return "Can't be left empty";
                  } else {
                    if (int.parse(onValidate) <
                        int.parse(controller.minimumPurchase)) {
                      return "Amount is low";
                    }
                    if (int.parse(onValidate) >
                        int.parse(controller.minimumPurchase)) {
                      controller.amount = int.parse(onValidate);
                      controller.update();
                    }
                    ;
                  }
                },
                (onSaved) {},
                borderColor: Colors.black,
                borderFocusColor: Colors.black,
                borderRadius: 5,
                paddingLeft: 0,
                paddingRight: 0,
                isNumeric: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // added
                  children: [
                    Expanded(
                      // added
                      child: ElevatedButton(
                        onPressed: controller.Fvalidate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text("Submit Request"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      // added
                      child: ElevatedButton(
                        onPressed: controller.Reset,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text("Reset"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
