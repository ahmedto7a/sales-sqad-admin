import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  var selectedButton = 'Task'.obs;

  void onAppBarLeadingPressed() {
    Get.back();
  }

  void onButtonPressed(String buttonName) {
    selectedButton.value = buttonName;
    update();
  }
}
