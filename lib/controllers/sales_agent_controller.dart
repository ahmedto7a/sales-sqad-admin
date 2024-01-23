import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesAgentController extends GetxController {
  final name = ''.obs;
  final phoneNumber = ''.obs;
  final email = ''.obs;
  final startDate = ''.obs;
  final progressValue1 = 0.0.obs;
  final progressValue2 = 0.0.obs;
  final progressValue3 = 0.0.obs;

  final nameController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final startDateController = TextEditingController().obs;


  void updateProgressValue1(double value) {
    progressValue1.value = value;
  }

  void updateProgressValue2(double value) {
    progressValue2.value = value;
  }

  void updateProgressValue3(double value) {
    progressValue3.value = value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email cannot be empty';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name cannot be empty';
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return 'Phone number cannot be empty';
    return null;
  }

  String? validateStartDate(String? value) {
    if (value == null || value.isEmpty) return 'The start date cannot be empty';
    return null;
  }

  void onLeadingIconPressed() {
    Get.back();
  }

  void onSave() {
    print("Things to do to save task and push to api");
  }
}
