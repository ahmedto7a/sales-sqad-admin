
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskController extends GetxController {
  final taskDate = DateTime.now().obs;
  final startTime = TimeOfDay.now().obs;
  final endTime = TimeOfDay.now().obs;
  final taskNameController = TextEditingController();

  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  var selectedIndex =
      (-1).obs;

  var taskNameErrorText = Rx<String?>(null);
  var taskDateErrorText = Rx<String?>(null);
  var startTimeErrorText = Rx<String?>(null);
  var endTimeErrorText = Rx<String?>(null);


  Future<void> selectDateTime() async {
    await selectDate();

    await selectStartTime();

    await selectEndTime();

  }

  Future<void> selectDate() async {
    final date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: "Select Date"
    );
    if (date != null) {
      taskDate.value = date;
      dateController.text = DateFormat('dd/MM/yyyy').format(taskDate.value);

    }
  }

  Future<void> selectStartTime() async {
    final time = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      helpText: "Select Start Time"
    );
    if (time != null) {
      startTime.value = time;
      startTimeController.text = startTime.value.format(Get.context!);

    }
  }

  Future<void> selectEndTime() async {
    final time = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
        helpText: "Select End Time"
    );
    if (time != null) {
      endTime.value = time;
      endTimeController.text = endTime.value.format(Get.context!);

    }

  }

  void updateSelectedIndex(int index) {
    selectedIndex.value =
        index; // Update the selected index when a button is pressed
  }

  String? validateTaskName(String? value) {
    if (value == null || value.isEmpty) return 'Task name cannot be empty';
    return null;
  }

  String? validateTaskDate(String? value) {
    if (value == null || value.isEmpty) return 'Task date cannot be empty';
    return null;
  }

  String? validateStartTime(String? value) {
    if (value == null || value.isEmpty) return 'Start time cannot be empty';
    return null;
  }

  String? validateEndTime(String? value) {
    if (value == null || value.isEmpty) return 'End time cannot be empty';
    return null;
  }

  void onAppBarLeadingPressed() {
    Get.back();
  }

  void onSaveButtonPressed() {
    Get.back();
  }
}


class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
