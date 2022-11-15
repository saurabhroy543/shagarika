import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/splash_controller.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Container(
                height: 120,
                width: double.infinity,
                child: Image.asset("assets/fintech.png"),
              ),
            ),
          );
        });
  }
}
