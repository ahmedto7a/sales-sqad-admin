import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/finger_print.dart';


class AttendFingerprint extends GetWidget<FingerAuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title:Text('Login With Finger Print', style: TextStyle( color: AppColors.primaryColor)),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.fingerprint,
                size: 150,
                color: Colors.grey ,

              ),
              SizedBox(height: 20),


              _getLoginButton(),
            ],
          ),
        ),
      ),

    );
  }

  Widget _getLoginButton() {
    return Obx(() {
      if (controller.isBiometricsSupported) {
        return OutlinedButton(

          style: OutlinedButton.styleFrom(

          side: BorderSide(width: 1.7, color: Colors.grey),
        ),

          onPressed: () {
            controller.signInWithBiometrics();
          },
          child: Text("Put Your Fingerprint",style: TextStyle(
            color: AppColors.primaryColor,
          ),
          ),
        );
      } else {
        return Text(
          'Oops, device does not support attended by biometrics',
          style: Get.textTheme.bodyText1!.copyWith(color: Get.theme.errorColor),
        );
      }
    });
  }
}
