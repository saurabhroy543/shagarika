import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class TransactionReport extends StatefulWidget {
  const TransactionReport({Key? key}) : super(key: key);

  @override
  _TransactionReportState createState() => _TransactionReportState();
}

class _TransactionReportState extends State<TransactionReport> {
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
  String? transactionTypeId;
  List<dynamic> transactionType = [
    {'id': 1, 'label': 'Purchase'},
    {'id': 2, 'label': 'Redemption'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction Type"),
        backgroundColor: Colors.blue,
      ),
      body: _uiWidget(),
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
                  child: Text(
                    getDate(toDate.toString()),
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "Transaction Type",
                "Select Transaction Type",
                transactionTypeId,
                transactionType,
                    (onChanged) {
                  setState(() {
                    transactionTypeId = onChanged;
                  });
                },
                    (onValidate) {
                  if (onValidate == Null) {
                    return "please Select Transaction Type";
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
              ElevatedButton(
                  onPressed: Fvalidate,
                  child: const Text("Show Report")),
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
