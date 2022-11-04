import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          title: const Text("Dashboard"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
                children:   const [
                  Center(
                    child:
                     Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Welcome ',
                            style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600,color: Colors.black45)),
                        TextSpan(
                            text:"Rishi",
                            // '${controller.userModel.user.firstName.capitalizeFirst}',
                            style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600,color: Colors.blue)),
                      ])),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
