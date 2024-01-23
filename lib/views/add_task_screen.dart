
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';
import '../controllers/add_task_controller.dart';
import '../widgets/advanced_custom_button.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';

class AddTask extends StatelessWidget {
  final AddTaskController controller = Get.put(AddTaskController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Add Task',
          leadingIcon: Icons.arrow_back_ios_rounded,
          onLeadingPressed: controller.onAppBarLeadingPressed,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Task Name',
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      textInputAction: TextInputAction.next,
                      controller: controller.taskNameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      controller: controller.dateController,
                      onTap: () => controller.selectDate(),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Start Time',
                              labelStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            controller: controller.startTimeController,
                            onTap: () => controller.selectStartTime(),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'End Time',
                              labelStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            controller: controller.endTimeController,
                            onTap: () => controller.selectEndTime(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task Status",
                          style: TextStyle(
                              fontSize: AppFontSizes.small, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              2,
                              (index) => GetBuilder<AddTaskController>(
                                    builder: (controller) {
                                      return Obx(() => AdvancedCustomButton(
                                            text: [
                                              "On Going",
                                              "Completed",
                                            ][index],
                                            onPressed: () => controller
                                                .updateSelectedIndex(index),
                                            height: screenHeight * 0.075,
                                            width: screenWidth * 0.4,
                                            textSize: AppFontSizes.verySmall,
                                            isSelected: controller
                                                    .selectedIndex.value ==
                                                index,
                                          ));
                                    },
                                  )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    CustomButton(
                      text: "Save",
                      backgroundColor: AppColors.primaryColor,
                      fontSize: AppFontSizes.medium,
                      width: screenWidth * 0.7,
                      height: screenHeight * 0.06,
                      onPressed: controller.onSaveButtonPressed,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
