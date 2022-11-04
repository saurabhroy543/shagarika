import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class PurchaseRequest extends StatefulWidget {
  const PurchaseRequest({Key? key}) : super(key: key);

  @override
  _PurchaseRequestState createState() => _PurchaseRequestState();
}

class _PurchaseRequestState extends State<PurchaseRequest> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void Fvalidate() {
    if (formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }
  var minimumPurchase="00";
  var minimumAdditionalPurchase='00';
  String? nameId;
  List<dynamic> items = [
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Request"),
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Minimum Purchase Amount',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: minimumPurchase,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              const SizedBox(height: 10,),
              Row(
                children: const [
                  Text(
                    'Minimum Additional Purchase Amount',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: minimumAdditionalPurchase,
                    border: OutlineInputBorder(
                      borderSide:  const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(5.0),
                    )),
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
