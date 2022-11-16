import 'package:flutter/services.dart';
import 'package:shagarika/modules/splash.dart';
import 'package:flutter/material.dart';
import 'package:shagarika/utils/app_pages.dart';
import 'package:shagarika/utils/storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main()async {
  await Storage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fintech Pool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary:Colors.yellow),
      ),
      home:  const Splash(),
      getPages: AppPages.pages,
      builder:EasyLoading.init(),
    );
  }
}

