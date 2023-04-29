import 'package:flutter/material.dart';
import 'package:shagarika/modules/controllers/login_controller.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("Login Page"),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Center(
                        child: SizedBox(
                            width: 200,
                            height: 150,
                            // decoration: BoxDecoration(
                            //     color: Colors.red,
                            //     borderRadius: BorderRadius.circular(50.0)),
                            child: Image.asset('assets/cpc-logo.png')),
                      ),
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'UserName',
                            hintText: 'Enter valid username'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter UserName";
                          }
                        },
                        onChanged: (value) {
                          controller.username = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Obx(() =>TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter a valid password";
                          }
                        },
                        obscureText: controller.showPassword.value,
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password',
                            suffixIcon: IconButton(
                                onPressed: (){
                                  controller.showPassword.toggle();
                                },
                                icon: Icon(controller.showPassword.value ? Icons.visibility_off : Icons.visibility)),
                        ),
                        onChanged: (password) {
                          controller.password = password;
                        },
                      )),
                    ),
                    // TextButton(
                    //   onPressed: (){
                    //   },
                    //   child: const Text(
                    //     'Forgot Password',
                    //     style: TextStyle(color: Colors.blue, fontSize: 15),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () async {
                          if (controller.formKey.currentState!.validate()) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            await controller.userLogin(
                                controller.username, controller.password);
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
