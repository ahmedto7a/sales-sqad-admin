import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/sign_in_controller.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sign In",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: Key("login_form_key"),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                        fontSize: AppFontSizes.large,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: screenWidth * 0.65,
                    child: Text(
                      'Please enter your email address and password for login',
                      softWrap: true,
                      style: TextStyle(
                          fontSize: AppFontSizes.small, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 36),
                  CustomTextField(
                    title: 'Username',
                    hintText: 'Enter your username',
                    controller: controller.mailCtrl,
                    validator: (value) => controller.validateUsername(value),
                    errorText: controller.usernameErrorText,
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    title: 'Password',
                    controller: controller.passwordCtrl,
                    hintText: 'Enter your password',
                    validator: (value) => controller.validatePassword(value),
                    isPasswordField: true,
                    errorText: controller.passwordErrorText,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: controller.onForgotPasswordPressed,
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: AppFontSizes.verySmall),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Center(
                    child:Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return CustomButton(
                          text: 'Sign In',
                          backgroundColor: Colors.red,
                          onPressed: () async {
                            controller.isLoading.value = true;
                            String? errorMessage = await controller.onSignInPressed();
                            controller.isLoading.value = false;
                            if (errorMessage != null) {
                              Get.dialog(
                                AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Failed to sign in. Error: $errorMessage'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          fontSize: AppFontSizes.small,
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.065,
                        );
                      }
                    }),


                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
