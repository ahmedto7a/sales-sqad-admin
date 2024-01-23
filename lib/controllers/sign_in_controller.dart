import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../views/home_screen.dart';

class SignInController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;


  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  var usernameErrorText = Rx<String?>(null);
  var passwordErrorText = Rx<String?>(null);

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username cannot be empty';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    checkToken();
  }

  Future<void> checkToken() async {
    final storage = GetStorage();
    var response = storage.read('response');
    if (response != null) {
      Get.offAll(() => HomeScreen());
    }
  }

  Future<String?> onSignInPressed() async {
    usernameErrorText.value = null;
    passwordErrorText.value = null;

    bool isValid = true;
    if (mailCtrl.value.text.isEmpty) {
      usernameErrorText.value = 'Please enter a valid username';
      isValid = false;
    }
    if (passwordCtrl.value.text.isEmpty) {
      passwordErrorText.value = 'Please enter a valid password';
      isValid = false;
    }

    if (isValid) {
      isLoading.value = true;
      String? errorMessage = await signIn();
      isLoading.value = false;
      return errorMessage;
    } else {
      return 'Validation failed';
    }
  }




  Future<String?> signIn() async {
    Uri baseUrl = Uri.parse("https://dgcuae.com/api/prototype/user/login");

    var res = await http.post(baseUrl, body: {
      "email": mailCtrl.text.trim(),
      "password": passwordCtrl.text.trim(),
    });
    print(passwordCtrl.text.trim() + "---this is the password");
    var response = jsonDecode(res.body);
    if (response['status'] == 'successful') {
      final storage = GetStorage();
      await storage.write('token', response['data']['token']);
      print("The status is: ${response['status']}");
      print("the token stored is: " + storage.read('token'));
      Get.offAll(() => HomeScreen());
      return null;
    } else {
      print("The Error is: ${response['message']}");
      return response['message'];
    }
  }



  void onForgotPasswordPressed() {
    print('Forgot password pressed');
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }
}
