import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:intl/intl.dart';

import 'drawer.dart';

class SIPrequest extends StatefulWidget {
  const SIPrequest({Key? key}) : super(key: key);

  @override
  _SIPrequestState createState() => _SIPrequestState();
}

class _SIPrequestState extends State<SIPrequest> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var fromDate = DateTime.now();
  var toDate = DateTime.now();
  bool perpetualSIP = false;

  getDate(String date) {
    DateTime res = DateTime.parse(date);
    return DateFormat('dd-MM-yyy').format(res).toString();
  }

  void Fvalidate() {
    if (formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }

  var minimumPurchase = "00";
  var minimumAdditionalPurchase = '00';
  String? nameId;
  List<dynamic> name = [
    {'id': 1, 'label': 'Rishi kumar'},
  ];
  var amcId;
  List<dynamic> amc = [
    {'id': 1, 'label1': 'AMC'},
  ];
  String? schemeId;
  List<dynamic> scheme = [
    {'id': 1, 'label': 'Scheme'},
  ];
  String? folioId;
  List<dynamic> folioNo = [
    {'id': 1, 'label': 'Folio Number'},
  ];
  String? SIPTypeId;
  List<dynamic> SIPType = [
    {'id': 1, 'label': 'SIP TYPES'},
  ];
  String? dividendId;
  List<dynamic> dividend = [
    {'id': 1, 'label': 'Dividend Payout'},
    {'id': 2, 'label': 'Dividend Re-Investment'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIP Request"),
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
                "Select Investor Name",
                nameId,
                name,
                (onChanged) {
                  nameId = onChanged;
                },
                (onValidate) {
                  if (onValidate == null) {
                    return "please Select Investor";
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
                "AMC",
                "Select AMC",
                amcId,
                amc,
                (onChanged) {
                  amcId = onChanged;
                },
                (onValidate) {
                  if (onValidate == null) {
                    return "please Select AMC";
                  }
                },
                optionLabel: 'label1',
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
                  schemeId = onChanged;
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
                "Dividend",
                "Select Dividend",
                dividendId,
                dividend,
                (onChanged) {
                  dividendId = onChanged;
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
                  folioId = onChanged;
                },
                (onValidate) {
                  if (onValidate == Null) {
                    return "please Folio Number";
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
                SIPTypeId,
                SIPType,
                (onChanged) {
                  SIPTypeId = onChanged;
                },
                (onValidate) {
                  if (onValidate == null) {
                    return "please Select SIP";
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
                children: const [
                  Text(
                    'SIP Start Date',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  fromDate = showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ).then((value) {
                    setState(() {
                      fromDate = value!;
                    });
                  }) as DateTime;
                  // controller.update();
                },
                child: Text(
                  getDate(fromDate.toString()),
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'SIP End Date',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  toDate = showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ).then((value) {
                    setState(() {
                      toDate = value!;
                    });
                  }) as DateTime;
                  // controller.update();
                },
                child: Text(
                  getDate(toDate.toString()),
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: perpetualSIP,
                    onChanged: (newBool) {
                      setState(() {
                        perpetualSIP = newBool!;
                      });
                    },
                  ),
                  const Text("Perpetual SIP",style: TextStyle(fontSize: 15),)
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
