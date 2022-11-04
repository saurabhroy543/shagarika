import 'package:flutter/material.dart';
import 'home.dart';
import 'log.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 200,
            height: 150,
            // decoration: BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.circular(50.0)),
            child: Image.asset('assets/cpc-logo.png')),
      ),
    );
  }
}
