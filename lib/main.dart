
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sales_sqad_admin/views/attend_finger_screen.dart';
import 'package:sales_sqad_admin/views/onboarding/splash_screen.dart';
import 'controllers/finger_print.dart';
import 'controllers/sign_in_controller.dart';
import 'views/auth/sign_in_screen.dart';
import 'views/home_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.lazyPut(() => FingerAuthController());
  Get.put(SignInController()); // in the new sales agent it asked to initialize the sign in controller
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget? _myScreen;

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (storage.read("token") != null) {
      _myScreen = AttendFingerprint();
    } else {
      _myScreen = SplashScreen();
    }
    return GetMaterialApp(
        title: 'Sales Management',
        // home: SplashScreen(),
         home: _myScreen!,
        debugShowCheckedModeBanner: false);
  }
}
