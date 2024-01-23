import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/salesmen.dart';
import '../views/all_salesmen_screen.dart';
import '../views/target_status_screen.dart';

class DashboardController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  var salesmen = <Salesman>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    fetchSalesmen();
  }

  Future<void> fetchSalesmen() async {
    isLoading.value = true;

    Uri baseUrl = Uri.parse("https://dgcuae.com/api/prototype/users");

    final storage = GetStorage();
    String? token = storage.read('token');
    var res = await http.get(baseUrl, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
    });

    var response = jsonDecode(res.body);
    if (response['status'] == 'successful') {
      var newSalesmen =
          (response['data'] as List).map((i) => Salesman.fromJson(i)).toList();
      salesmen.clear();
      salesmen.addAll(newSalesmen);
    }
    isLoading.value = false;
  }

  void changeTab(int index) {
    tabController.animateTo(index);
  }

  void navigateToTargetStatus() {
    Get.to(() => TargetStatus(salesmen: salesmen.first,));
  }

  void navigateToSalesmen() {
    Get.to(() => AllSalesmenPage(salesmen: salesmen));
  }
}
