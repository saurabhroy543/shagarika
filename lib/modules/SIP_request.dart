import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/utils/storage.dart';
// import 'package:shagarika/utils/storage_keys.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'controllers/sipRequestController.dart';
import 'drawer.dart';
import 'package:get/get.dart';

class SIPrequest extends StatelessWidget {
  const SIPrequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SipRequestController>(
      init: SipRequestController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.cyan[100],
            appBar: AppBar(
              backgroundColor: Colors.cyan[700],
              title: const Text("SIP Request"),
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
                  controller.getFolio(
                      controller.schemeId, controller.schemeName);
                  controller.update();
                  controller.isLoading(false);
                },
                (onValidate) {
                  if (onValidate == null) {
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
                "Dividend",
                "Select Dividend",
                controller.dividendId,
                controller.dividend,
                (onChanged) {
                  var data = controller.dividend[int.parse(onChanged)];
                  controller.isLoading(true);
                  controller.dividendId = data['label'];
                  controller.update();
                  controller.isLoading(false);
                },
                (onValidate) {
                  if (onValidate == null) {
                    return "please Select Dividend";
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
                  if (onValidate == null) {
                    return "please Select Folio Number";
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
                "SIP Type",
                "Select SIP Type",
                controller.SIPTypeId,
                controller.SIPType,
                (onChanged) {
                  var data = controller.SIPType[int.parse(onChanged)];
                  controller.isLoading(true);
                  controller.SIPTypeId = data['label'];
                  controller.update();
                  controller.isLoading(false);
                },
                (onValidate) {
                  if (onValidate == null) {
                    return "please Select SIP Type";
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
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    Text(
                      'SIP Start Date',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'SIP End Date',
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        controller.fromDate = showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        ).then((value) {
                          controller.fromDate = value!;
                          controller.update();
                        }) as DateTime;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Text(
                          controller.getDate(controller.fromDate.toString()),
                          style:
                              const TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        controller.toDate = showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        ).then((value) {
                          controller.toDate = value!;
                          controller.update();
                        }) as DateTime;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Text(
                          controller.getDate(controller.toDate.toString()),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: controller.perpetualSIP,
                    onChanged: (newBool) {
                      controller.perpetualSIP = newBool!;
                      controller.update();
                    },
                  ),
                  const Text(
                    "Perpetual SIP",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              FormHelper.inputFieldWidgetWithLabel(
                context,
                "Amount To be Invested",
                "Amount To be Invested",
                "00",
                (onValidateval) {
                  if (onValidateval.isEmpty) {
                    return "Can't be left empty";
                  } else {
                    controller.amount = int.parse(onValidateval);
                    controller.update();
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
                        onPressed: controller.formValidate,
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
                        onPressed: controller.Reset,
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

// Widget _buildPopupDialog(BuildContext context, controller) {
//   controller.formValidate;
//   print('object');
//   return AlertDialog(
//     title: const Text('Your Selection'),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children:  <Widget>[
//         const Text("Client Name:",style: TextStyle(color: Colors.grey)),
//         Text(Storage.username!,style: const TextStyle(color: Colors.blue),),
//         const SizedBox(height: 10,),
//         const Text("AMC:",style: TextStyle(color: Colors.grey)),
//         Text(controller.amcId,style: const TextStyle(color: Colors.blue),),
//         const SizedBox(height: 10,),
//
//         const Text("Scheme:",style: TextStyle(color: Colors.grey)),
//         Text(controller.schemeName,style: const TextStyle(color: Colors.blue),),
//         const SizedBox(height: 10,),
//
//         const Text("Dividend:",style: TextStyle(color: Colors.grey)),
//         Text(controller.dividendId,style: const TextStyle(color: Colors.blue),),
//         const SizedBox(height: 10,),
//
//         const Text("Folio Number:",style: TextStyle(color: Colors.grey)),
//         Text(controller.folioId,style: const TextStyle(color: Colors.blue),),
//         const SizedBox(height: 10,),
//
//         const Text("SIP Type:",style: TextStyle(color: Colors.grey)),
//         Text(controller.SIPTypeId,style: const TextStyle(color: Colors.blue),),
//         ElevatedButton(
//           onPressed: controller.formValidate,
//           child: const Text('Submit'),
//         ),
//
//
//       ],
//     ),
//     actions: <Widget>[
//       ElevatedButton(
//         onPressed: () {
//           controller.formValidate();
//           print('object');
//           Get.to(() => const Home());
//         },
//         child: const Text('Close'),
//       ),
//     ],
//   );
// }
