import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:get/get.dart';
import 'package:shagarika/utils/app_pages.dart';
import 'package:shagarika/utils/app_utils.dart';
import 'home.dart';

class VerifyPin extends StatelessWidget {
  const VerifyPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VERIFY MPIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const VerifyPinPage(),
    );
  }
}

class VerifyPinPage extends StatefulWidget {
  const VerifyPinPage({Key? key}) : super(key: key);

  @override
  State<VerifyPinPage> createState() => _VerifyPinPageState();
}

class _VerifyPinPageState extends State<VerifyPinPage> {
  late String pin;
  bool clear = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify MPIN'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Verify PIN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Please enter your MPIN.'),
            const SizedBox(height: 30),
            Expanded(
              child: PinCodeWidget(
                onEnter: (_, __) {
                  if (_ == Storage.MPIN) {
                    Get.off(() => const Home());
                  } else {
                    _ = '';
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  }
                },
                // initialPinLength: 4,
                onChangedPin: (_) {},
                borderSide:
                    const BorderSide(width: 4, color: Colors.blueAccent),
                buttonColor: Colors.white,
                numbersStyle: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black, // specify the desired text color here
                ),
                centerBottomWidget: TextButton(
                  onPressed: () {
                    AppUtils.logout();
                    // Get.back();
                    Get.offAllNamed(Routes.login);
                  },
                  child: const Text('Forgot PIN?'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Invalid PIN'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Please Enter a Valid PIN"),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
