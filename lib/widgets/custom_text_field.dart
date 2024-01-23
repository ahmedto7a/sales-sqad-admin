import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/sign_in_controller.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData? endIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Rx<String?>? errorText;
  final double? width;
  final double? height;
  final bool? isPasswordField;
  final SignInController signInController = Get.find();

  CustomTextField({
    required this.title,
    required this.hintText,
    this.endIcon,
    this.onChanged,
    this.validator,
    this.controller,
    this.errorText,
    this.width,
    this.height,
    this.isPasswordField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: AppFontSizes.small, color: Colors.grey),
        ),
        SizedBox(height: 8),
        Container(
          width: width,
          height: height,
          child: Obx(() {
            return TextFormField(
              controller: controller,
              obscureText: isPasswordField != null && isPasswordField!
                  ? !signInController.isPasswordVisible.value
                  : false,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                suffixIcon: isPasswordField != null && isPasswordField!
                    ? IconButton(
                        icon: Icon(
                          signInController.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: signInController.togglePasswordVisibility,
                      )
                    : null,
                errorText: errorText?.value,
              ),
              onChanged: (value) {
                onChanged!(value.trim());
              },
              validator: validator,
            );
          }),
        ),
      ],
    );
  }
}
