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
                  var data = controller.AMC[int.parse(onChanged)];
                  controller.AMCId = data['amc_code'];
                  controller.AMC_name = data['label'];
                  controller.getTargetScheme(data['amc_code']);
                  controller.update();
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
                  var data = controller.scheme[int.parse(onChanged)];
                  controller.schemeId = data['label'];
                  controller.getFolio(data['label']);
                  controller.update();
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
                  controller.getSchemeUnits(
                      controller.schemeId,data['label']);
                  controller.update();                },
                (onValidate) {
                  if (onValidate == null) {
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
                          controller.value = 'Amount';
                          controller.showCalculatedSwitchAmount = false;
                          controller.showUnitAmountTextBox = true;
                          controller.totalValue = onChanged;
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
                          controller.value = 'Unit';
                          controller.totalValue = '0';
                          controller.showUnitAmountTextBox = true;
                          controller.showCalculatedSwitchAmount = true;
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
                          // controller.value = 'Units';
                          controller.showCalculatedSwitchAmount = true;
                          controller.showUnitAmountTextBox = false;
                          controller
                              .calculateTotalValue(controller.availableUnit);
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
                      hintText: controller.availableAmount.toString(),
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
              if (controller.showUnitAmountTextBox)
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "Units to Redeem",
                "${controller.value} to Redeem",
                "",
                (onValidateval) {
                  if (controller.redeemBy != 'all units' &&
                      onValidateval.isEmpty){
                    return "Can't be left empty";
                  }else {
                    if (controller.redeemBy == 'all units') {
                      onValidateval = controller.availableUnit;
                    }else if (controller.redeemBy == 'amount' && double.parse(onValidateval)> controller.availableAmount){
                      return "You have only ${controller.availableAmount}";
                    }else if (controller.redeemBy == 'unit' && double.parse(onValidateval)> double.parse(controller.availableUnit)){
                      return "You have only ${controller.availableUnit}";
                    }
                    controller.totalValue = onValidateval;
                    controller.update();
                  }
                },
                (onSaved) {},
                onChange: (value) {
                  if (controller.redeemBy == 'unit') {
                    controller.calculateTotalValue(value);
                    // value = double.parse(value);
                    controller.update();
                  }
                },
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
              if (controller.showCalculatedSwitchAmount)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: const [
                      Text(
                        'Calculated Amount',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              if (controller.showCalculatedSwitchAmount)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: (controller.totalValue).toString(),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
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
                        onPressed: controller.formValidate,
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
