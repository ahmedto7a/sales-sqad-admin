import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/salesmen.dart';
import '../views/add_task_screen.dart';

class TargetStatusController extends GetxController {
  Salesman salesmen;

  ValueNotifier<double> valueNotifier = ValueNotifier(0);
  ValueNotifier<double> valueNotifier2 = ValueNotifier(0);

  double completed=0.0;


  TargetStatusController(this.salesmen) {
    completed = double.parse(salesmen.target) - double.parse(salesmen.current);

    valueNotifier.value = (double.parse(salesmen.current) / double.parse(salesmen.target)) * 100;
    valueNotifier2.value = ((double.parse(salesmen.target) - double.parse(salesmen.current)) / double.parse(salesmen.target)) * 100;

  }

  void onAppBarLeadingPressed() {
    Get.back();
  }

  void onAppBarEndPressed() {
    Get.to(AddTask());
  }

  void onLeadsPressed() {

  }
}