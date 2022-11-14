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
      appBar: AppBar(
        title: const Text("DetailedHoldingReport"),
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
                  Text(
                    'from Date',
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
                    'To Date',
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
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: Fvalidate, child: const Text("Show Report")),
              const SizedBox(
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
