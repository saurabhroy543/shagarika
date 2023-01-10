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
            Text(
              'Set-Up PIN',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            const Text('You can use this PIN to unlock the app.'),
            const SizedBox(height: 30),
            Expanded(
              child: PinCodeWidget(
                buttonColor: Colors.black,
                emptyIndicatorColor: Colors.blue,
                filledIndicatorColor: Colors.black,
                onFullPin: (_, __) {
                  setState(() {
                    pin = _;
                  });
                },
                initialPinLength: 4,
                onChangedPin: (_) {},
                clearOnFilled: false,
                leftBottomWidget: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      Storage.MPIN = pin;
                      Get.to(() => const VerifyPin());
                    },
                    child: const Text("Set PIN")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
