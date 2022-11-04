// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shagarika/password_data_field.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     height: Get.height / 2,
//                     color: Colors.blue,
//                     child: Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Welcome To',
//                           ),
//                           Text(
//                             'FinTool',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: Get.height / 2.4,
//                           color: Colors.blue,
//                         ),
//                         Container(
//                           width: Get.width,
//                           height: Get.height / 2.1,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(20.sp),
//                                   topRight: Radius.circular(20.sp))),
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 top: 20.h, left: 20.w, right: 20.w),
//                             child: Form(
//                               child: Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Login',
//                                   ),
//                                   SizedBox(
//                                     height: 20.h,
//                                   ),
//                                   Text(
//                                     'Username',
//                                     ),
//                                   TextField(
//                                     decoration: new InputDecoration.collapsed(
//                                     hintText: 'UserId/ Mob No/ Email',),
//                                     onChanged: (value) {
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 20.h,
//                                   ),
//                                   Text('Password',
//                                      ),
//                                   PasswordDataField(
//                                     hintText: '********',
//                                     validator: (v) {
//                                       if (v!.isEmpty)
//                                         return 'Please enter a password';
//                                       return null;
//                                     },
//                                     // onForgotPasswordChange: () {
//                                     //   // controller.showPassword.value =
//                                     //   // !controller
//                                     //   //     .showPassword.value;
//                                     //   // controller.update();
//                                     // },
//                                     // onChanged: (value) {
//                                     //   // controller.password = value;
//                                     // },
//                                     // enabled:
//                                     // // controller.showPassword.value,
//                                   ),
//                                   SizedBox(
//                                     height: 20.h,
//                                   ),
//                                   ActionButton(
//                                     title: 'Log In',
//                                     onPressed: () async {
//                                       FocusScopeNode currentFocus =
//                                       FocusScope.of(context);
//                                       if (!currentFocus
//                                           .hasPrimaryFocus) {
//                                         currentFocus.unfocus();
//                                       }
//                                       await controller.userLogin(
//                                           controller.username,
//                                           controller.password);
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 10.h,
//                                   ),
//                                   Center(
//                                     child: InkWell(
//                                       onTap: () {
//                                         controller
//                                             .navigateToForgotPassword();
//                                       },
//                                       child: Text('Forgot Password?'),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     )
//     ,
//     )
//     ,
//   }
// }
