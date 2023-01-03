import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:intl/intl.dart';

import 'drawer.dart';

class DetailedHoldingReport extends StatefulWidget {
  const DetailedHoldingReport({Key? key}) : super(key: key);

  @override
  _DetailedHoldingReportState createState() => _DetailedHoldingReportState();
}

class _DetailedHoldingReportState extends State<DetailedHoldingReport> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var fromDate = DateTime.now();
  var toDate = DateTime.now();

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: const Text(
          "Detailed Holding Report",
        ),
        backgroundColor: Colors.cyan[700],
      ),
      body: _uiWidget(),
      drawer: SideDrawer(),
    );
  }

  Widget _uiWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.blueAccent,
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: const [
                        Text(
                          'From Date',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'To Date',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
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
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
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
                        ),
                        const SizedBox(
                          width: 40,
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
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: Fvalidate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan[700],
                        alignment: Alignment.bottomRight,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: const Text(
                        "Show Report",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      )),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
