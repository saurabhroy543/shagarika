import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'drawer.dart';

class RedemptionRequest extends StatefulWidget {
  const RedemptionRequest({Key? key}) : super(key: key);

  @override
  _RedemptionRequestState createState() => _RedemptionRequestState();
}

class _RedemptionRequestState extends State<RedemptionRequest> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void Fvalidate() {
    if (formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }

  var availableAmount;
  var availableUnit;
  int redeemBy = 1;
  String? nameId;
  List<dynamic> items = [
    {'id': 1, 'label': 'Rishi kumar'},
  ];
  var AMCId;
  List<dynamic> AMC = [
    {'id': 1, 'label': 'Target Scheme'},
  ];
  String? schemeId;
  List<dynamic> scheme = [
    {'id': 1, 'label': 'Scheme'},
  ];
  String? folioId;
  List<dynamic> folioNo = [
    {'id': 1, 'label': 'Folio Number'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redemption Request"),
        backgroundColor: Colors.blue,
      ),
      body: _uiWidget(),
      drawer: SideDrawer(),
    );
  }

  Widget _uiWidget() {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Investor Name",
                "Select Investor",
                nameId,
                items,
                    (onChanged) {
                  nameId = onChanged;
                },
                    (onValidate) {
                  if (onValidate == Null) {
                    return "please Select Client";
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
                "Select AMC",
                "Select AMC",
                AMCId,
                AMC,
                    (onChanged) {
                  setState(() {
                    AMCId = onChanged;
                  });
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
                schemeId,
                scheme,
                    (onChanged) {
                  setState(() {
                    schemeId = onChanged;
                  });
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
                folioId,
                folioNo,
                    (onChanged) {
                  setState(() {
                    folioId = onChanged;
                  });
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
              Row(
                children: [
                  const Text(
                    'Redeem By',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Radio(
                      value: 1,
                      groupValue: redeemBy,
                      onChanged: (onChanged) {
                        setState(() {
                          redeemBy = onChanged!;
                        });
                      }),
                  const Text(
                    'Amount',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 100,),
                  Radio(
                      value: 2,
                      groupValue: redeemBy,
                      onChanged: (onChanged) {
                        setState(() {
                          redeemBy = onChanged!;
                        });
                      }),
                  const Text(
                    'Unit',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 100,),
                  Radio(
                      value: 3,
                      groupValue: redeemBy,
                      onChanged: (onChanged) {
                        setState(() {
                          redeemBy = onChanged!;
                        });
                      }),
                  const Text(
                    'All Units',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Available Amount',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: availableAmount,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Available Units',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: availableUnit,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(5.0),
                    )),
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
                children: [
                  ElevatedButton(
                      onPressed: Fvalidate,
                      child: const Text("Submit Your Request")),
                  const SizedBox(
                    width: 100,
                  ),
                  ElevatedButton(
                      onPressed: Fvalidate, child: const Text("Reset")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
