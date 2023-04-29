import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'controllers/switchRequestController.dart';
import 'drawer.dart';
import 'package:get/get.dart';

class SwitchRequest extends StatelessWidget {
  const SwitchRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<switchRequestController>(
      init: switchRequestController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.cyan[100],
            appBar: AppBar(
              backgroundColor: Colors.cyan[700],
              title: const Text("Switch Request"),
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
                "Select Scheme",
                "Select Scheme",
                controller.schemeId,
                controller.scheme,
                (onChanged) {
                  var data = controller.scheme[int.parse(onChanged)];
                  controller.isLoading(true);
                  controller.schemeId = int.parse(data['scheme_id']);
                  controller.schemeName = data['label'];
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
                  controller.isLoading(true);
                  controller.folioId = data['label'];
                  controller.update();
                  controller.isLoading(false);
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
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Target Scheme",
                "Select Target Scheme",
                controller.targetSchemeId,
                controller.targetScheme,
                (onChanged) {
                  controller.targetSchemeId = onChanged;
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    const Text(
                      'Switch By',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: 'amount',
                        groupValue: controller.switchBy,
                        onChanged: (onChanged) {
                          controller.switchBy = onChanged!;
                          controller.update();
                        }),
                    const Text(
                      'Amount',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 90,
                  ),
                  Radio(
                      value: 'unit',
                      groupValue: controller.switchBy,
                      onChanged: (onChanged) {
                        print(onChanged);
                        controller.switchBy = onChanged!;
                        controller.update();
                      }),
                  const Text(
                    'Unit',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 90,
                  ),
                  Radio(
                      value: 'all units',
                      groupValue: controller.switchBy,
                      onChanged: (onChanged) {
                        controller.switchBy = onChanged!;
                        controller.update();
                      }),
                  const Text(
                    'All Units',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: controller.switchBy,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
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
                padding: const EdgeInsets.only(left: 10.0, right: 10),
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
                "Units to Switch",
                "Units to Switch",
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
                "Calculated Switch Amount",
                "Calculated Switch Amount",
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
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: controller.Fvalidate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text("Submit Your Request"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: controller.Fvalidate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
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
