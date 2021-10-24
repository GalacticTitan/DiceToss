import 'package:dice_master/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final loginController = Get.find<AuthController>();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 90,),
                Text('app_name'.tr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 50,),
            Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(18),
              height: 270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.5),
                    blurRadius: 2.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: const Offset(
                      2, // Move to right 10  horizontally
                      1, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'email'.tr,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'value_empty'.tr;
                        }
                        if (!value.isEmail) {
                          return 'invalid_email'.tr;
                        }
                      },
                      onSaved: (value) {
                        loginController.data['email'] = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'password'.tr,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'value_empty'.tr;
                        }
                      },
                      onSaved: (value) {
                        loginController.data['password'] = value;
                      },
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          if (loginController.isLoading.isTrue)
                            const CircularProgressIndicator(),
                          if (loginController.isLoading.isFalse)
                            ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  _formKey.currentState?.save();
                                  loginController.signIn();
                                },
                                child: Text('login'.tr)),
                          const SizedBox(
                            height: 10,
                          ),
                          if (loginController.isLoading.isFalse)
                            ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  _formKey.currentState?.save();
                                  loginController.signUp();
                                },
                                child: Text('signUp'.tr)),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
