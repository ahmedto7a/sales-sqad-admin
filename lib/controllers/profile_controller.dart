import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/adminInfo.dart';
import 'package:http/http.dart' as http;
import '../views/edit_admin_screen.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var adminInfo = AdminInfo(id: 0,name: '',email: '',phoneNumber: '',target: '',current: '',role: '',status: '',team: null,).obs;

  @override
  void onInit() {
    super.onInit();
    fetchAdminInfo();
  }

  Future<void> fetchAdminInfo() async {
    isLoading.value = true;
    Uri baseUrl = Uri.parse("https://dgcuae.com/api/prototype/user/profile");
    final storage = GetStorage();
    String? token = storage.read('token');
    var res = await http.get(baseUrl,headers: {'Authorization': 'Bearer $token',"Accept": "application/json",},);
    var response = jsonDecode(res.body);
    if (response['status'] == 'successful') {
      adminInfo.value = AdminInfo.fromJson(response['data']);
      update();
    }
    isLoading.value = false;
  }

  void editProfile() {
    Get.to(() => EditAdminPage(adminInfo: adminInfo.value));
  }

  void onLeadingPressed() {
    Get.back();
  }
}
