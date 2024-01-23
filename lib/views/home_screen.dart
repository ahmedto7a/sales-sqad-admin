
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_sqad_admin/views/profile_screen.dart';
import 'package:sales_sqad_admin/views/search_screen.dart';
import '../constants/constants.dart';
import '../controllers/home_controller.dart';
import 'chat_screen.dart';
import 'dashboard_screen.dart';
import 'new_sales_agent_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (homeController.selectedIndex.value) {
          case 0:
            return DashboardScreen();
          case 1:
            return SearchScreen();
          case 2:
            return NewSalesAgentScreen();
          case 3:
            return ChatPage();
          default:
            return ProfileScreen();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Material(
                elevation: 5.0,
                shape: CircleBorder(),
                color: Colors.transparent,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          elevation: 0.0,
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.changePage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.black54,
          selectedItemColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
