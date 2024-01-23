import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sales_sqad_admin/controllers/profile_controller.dart';

import '../models/adminInfo.dart';

class EditAdminController extends GetxController {
  final AdminInfo adminInfo;
  final AdminInfo initialAdminInfo;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  EditAdminController(this.adminInfo)
      : initialAdminInfo = AdminInfo.fromJson(adminInfo.toJson()) {
    nameController.text = adminInfo.name;
    emailController.text = adminInfo.email;
    phoneNumberController.text = adminInfo.phoneNumber;

  }

  Future<void> updateAdminInfo() async {
    Uri baseUrl = Uri.parse("https://dgcuae.com/api/prototype/user/profile/update");
    final storage = GetStorage();
    String? token = storage.read('token');

    Map<String, String> updatedFields = {};

    if (initialAdminInfo.name != nameController.text) {
      updatedFields['name'] = nameController.text;
    }
    if (initialAdminInfo.email != emailController.text) {
      updatedFields['email'] = emailController.text;
    }
    if (initialAdminInfo.phoneNumber != phoneNumberController.text) {
      updatedFields['phone_number'] = phoneNumberController.text;
    }

    var res = await http.put(
      baseUrl,
      headers: {
        'Authorization': 'Bearer $token',
        "Accept": "application/json",
      },
      body: updatedFields,
    );

    var response = jsonDecode(res.body);
    if (response['status'] == 'successful') {
      Get.find<ProfileController>().fetchAdminInfo();
      Get.back();
    } else {
      Get.defaultDialog(title: 'Error', middleText: response['message'],);
    }
  }
 void onLeadingIcon(){
    Get.back();
 }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();

    super.onClose();
  }
}
