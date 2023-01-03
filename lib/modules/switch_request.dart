import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'drawer.dart';

class SwitchRequest extends StatefulWidget {
  const SwitchRequest({Key? key}) : super(key: key);

  @override
  _SwitchRequestState createState() => _SwitchRequestState();
}

class _SwitchRequestState extends State<SwitchRequest> {
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
  int switchBy = 1;
  String? nameId;
  List<dynamic> items = [
    {'id': 1, 'label': 'Rishi kumar'},
  ];
  var targetSchemeId;
  List<dynamic> targetScheme = [
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
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: const Text("Switch Request"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(child: _uiWidget()),
      ),
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
                "Client Name",
                "Select Client",
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
                "Folio Number",
                "Select Folio Number",
                folioId,
                folioNo,
                (onChanged) {
                  folioId = onChanged;
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
                targetSchemeId,
                targetScheme,
                (onChanged) {
                  targetSchemeId = onChanged;
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Radio(
                        value: 1,
                        groupValue: switchBy,
                        onChanged: (onChanged) {
                          setState(() {
                            switchBy = onChanged!;
                          });
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
                      value: 2,
                      groupValue: switchBy,
                      onChanged: (onChanged) {
                        setState(() {
                          switchBy = onChanged!;
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
                  const SizedBox(
                    width: 90,
                  ),
                  Radio(
                      value: 3,
                      groupValue: switchBy,
                      onChanged: (onChanged) {
                        setState(() {
                          switchBy = onChanged!;
                        });
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: availableAmount,
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
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: availableUnit,
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
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan[700],
                      ),
                      onPressed: Fvalidate,
                      child: const Text("Submit Your Request")),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan[700],
                      ),
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
