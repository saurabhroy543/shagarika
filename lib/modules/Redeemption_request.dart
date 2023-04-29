import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:get/get.dart';

import 'controllers/RedeemptionController.dart';
import 'drawer.dart';

class RedemptionRequest extends StatelessWidget {
  const RedemptionRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedeemptionController>(
      init: RedeemptionController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.cyan[100],
            appBar: AppBar(
              backgroundColor: Colors.cyan[700],
              title: const Text("Redemption Request"),
            ),
            drawer: SideDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
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
                "Select AMC",
                "Select AMC",
                controller.AMCId,
                controller.AMC,
                (onChanged) {
                  controller.AMCId = onChanged;
                },
                (onValidate) {
                  if (onValidate == null) {
                    return "please Select Target Scheme";
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
                "Select Scheme",
                "Select Scheme",
                controller.schemeId,
                controller.scheme,
                (onChanged) {
                  controller.schemeId = onChanged;
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
                  controller.folioId = onChanged;
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    const Text(
                      'Redeem By',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: 'amount',
                        groupValue: controller.redeemBy,
                        onChanged: (onChanged) {
                          controller.redeemBy = onChanged!;
                          controller.update();
                        }),
                    const Text(
                      'Amount',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    Radio(
                        value: 'unit',
                        groupValue: controller.redeemBy,
                        onChanged: (onChanged) {
                          controller.redeemBy = onChanged!;
                          controller.update();
                        }),
                    const Text(
                      'Unit',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    Radio(
                        value: 'all unit',
                        groupValue: controller.redeemBy,
                        onChanged: (onChanged) {
                          controller.redeemBy = onChanged!;
                          controller.update();
                        }),
                    const Text(
                      'All Units',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: const [
                    Text(
                      'Available Amount',
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
                      hintText: controller.availableAmount,
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
                      'Available Units',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: controller.availableUnit,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "Units to Redeem",
                "Units to Redeem",
                "",
                (onValidateval) {
                  if (onValidateval.isEmpty) {
                    return "Can't be left empty";
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
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "Calculated Redemption Amount",
                "Calculated Redemption Amount",
                "",
                (onValidateval) {
                  if (onValidateval.isEmpty) {
                    return "Can't be left empty";
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: controller.Fvalidate,
                        child: const Text("Submit Your Request"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: controller.Reset,
                        child: const Text("Reset"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
