
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/sales_agent_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_slider.dart';
import '../widgets/custom_text_field.dart';

class NewSalesAgentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final SalesAgentController _controller = Get.put(SalesAgentController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back,
        title: 'New Sales Agent',
        onLeadingPressed: _controller.onLeadingIconPressed,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller.nameController.value,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: AppColors.secondaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _controller.phoneNumberController.value,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: AppColors.secondaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _controller.emailController.value,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppColors.secondaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _controller.startDateController.value,
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      labelStyle: TextStyle(color: AppColors.secondaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => CustomSlider(
                      title: 'Target Needed Calls Daily',
                      value: _controller.progressValue1.value,
                      min: 0,
                      max: 30,
                      onChanged: (double value) =>
                          _controller.updateProgressValue1(value),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => CustomSlider(
                      title: 'Target Needed Monthly EGP',
                      value: _controller.progressValue2.value,
                      min: 0,
                      max: 100000,
                      onChanged: (double value) =>
                          _controller.updateProgressValue2(value),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => CustomSlider(
                      title: 'Target Needed Other',
                      value: _controller.progressValue3.value,
                      min: 0,
                      max: 2000,
                      onChanged: (double value) =>
                          _controller.updateProgressValue3(value),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text: "Save",
                      backgroundColor: AppColors.primaryColor,
                      fontSize: AppFontSizes.medium,
                      width: screenWidth * 0.7,
                      height: screenHeight * 0.06,
                      onPressed: _controller.onSave),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
