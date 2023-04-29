import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:shagarika/modules/verifyPin.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:get/get.dart';

class SetPin extends StatelessWidget {
  const SetPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SET MPIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const SetPinPage(),
    );
  }
}

class SetPinPage extends StatefulWidget {
  const SetPinPage({Key? key}) : super(key: key);

  @override
  State<SetPinPage> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  late String pin;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SET MPIN'),
        // actions: [
        //   TextButton(
        //       onPressed: () {},
        //       child: const Text(
        //         'Skip',
        //         style: TextStyle(color: Colors.blueAccent),
        //       ))
        // ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Set-Up PIN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            const Text('You can use this PIN to unlock the app.\n                   [pin length : 4 to 25]'),
            const SizedBox(height: 30),
            Expanded(
              child: PinCodeWidget(
                // emptyIndicatorColor: Colors.blue,
                onEnter: (_, __) {
                  setState(() {
                    pin = _;
                    Storage.MPIN = pin;
                    Get.to(() => const VerifyPin());
                  });
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
