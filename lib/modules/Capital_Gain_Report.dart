import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:intl/intl.dart';

import 'drawer.dart';

class CapitalGainReport extends StatefulWidget {
  const CapitalGainReport({Key? key}) : super(key: key);

  @override
  _CapitalGainReportState createState() => _CapitalGainReportState();
}

class _CapitalGainReportState extends State<CapitalGainReport> {
  // double widthS = MediaQuery.of(context).size.width;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var fromDate = DateTime.now();
  var toDate = DateTime.now();
  bool financialYear = false;

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

  String? nameId;
  List<dynamic> name = [
    {'id': 1, 'label': 'Rishi kumar'},
  ];
  String? financialYearId;
  List<dynamic> financialYearList = [
    {'id': 1, 'label': '2021-2022'},
    {'id': 2, 'label': '2020-2021'},
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
        title: const Text("Capital Gain Report"),
        backgroundColor: Colors.cyan[700],
      ),
      drawer: SideDrawer(),
      body: _uiWidget(),
    );
  }

  Widget _uiWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        child: Form(
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
                      setState(() {
                        nameId = onChanged;
                      });
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'from Date',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'To Date',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        AbsorbPointer(
                            absorbing: financialYear,
                            child: GestureDetector(
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
                              child: Container(
                                // margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                child: Text(
                                  getDate(fromDate.toString()),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.blueAccent),
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 50,
                        ),
                        AbsorbPointer(
                          absorbing: financialYear,
                          child: GestureDetector(
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
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.black,
                                  )),
                              child: Text(
                                getDate(toDate.toString()),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.blueAccent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: financialYear,
                        onChanged: (newBool) {
                          setState(() {
                            financialYear = newBool!;
                          });
                        },
                      ),
                      const Text(
                        "By Financial Year",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  FormHelper.dropDownWidgetWithLabel(
                    context,
                    "Financial Year",
                    "Select Financial Year",
                    financialYearId,
                    financialYearList,
                    (onChanged) {
                      setState(() {
                        financialYearId = onChanged;
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: Fvalidate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan[700],

                        padding:
                            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: const Text(
                        "Show Report",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      )),
                  const SizedBox(
                    width: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
