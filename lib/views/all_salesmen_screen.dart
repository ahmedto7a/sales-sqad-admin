
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/all_salesmen_controller.dart';
import '../models/salesmen.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/sales_man_card.dart';

class AllSalesmenPage extends StatelessWidget {
  final AllSalesmenController controller;

  AllSalesmenPage({required RxList<Salesman> salesmen})
      : controller = Get.put(AllSalesmenController(salesmen));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Salesmen',
        leadingIcon: Icons.arrow_back_ios_rounded,
        onLeadingPressed: controller.goBack,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Leaderboard
            Expanded(
              flex: 1,
              child: Obx(() {
                List<Salesman> topSalesmen = controller.getTopSalesmen(3);
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, Colors.red],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                          50), // More curved corners at the bottom
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSalesmanProfile(
                            topSalesmen[1], '2nd', 40.0), // 2nd place
                        _buildSalesmanProfile(
                            topSalesmen[0], '1st', 50.0), // 1st place
                        _buildSalesmanProfile(
                            topSalesmen[2], '3rd', 40.0), // 3rd place
                      ],
                    ),
                  ),
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: controller.updateFilteredSalesmen,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            // Salesmen list
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredSalesmen.length,
                    itemBuilder: (context, index) {
                      return SalesmanCard(
                        salesman: controller.filteredSalesmen[index],
                        onTap: controller.navigateToTargetStatus,
                        backgroundColor: Colors.white,
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesmanProfile(Salesman salesman, String rank, double avatarRadius) {
    return Column(
      mainAxisAlignment: rank == '1st' ? MainAxisAlignment.start : MainAxisAlignment.center, // Adjust alignment based on rank
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: avatarRadius,
              child: Text(rank, style: TextStyle(color: Colors.white)),
            ),
            if (rank == '1st') // Only show the crown for the 1st place
              Positioned(
                top: 10,
                right: 4,
                child: Transform.rotate(
                  angle: 0.6,// Adjust as needed
                  child: Image.asset('lib/assets/crown.png', width: avatarRadius),
                ),
              ),
          ],
        ),
        Text('${salesman.name}', style: TextStyle(color: Colors.white,fontSize: 18)),
        Text('${salesman.role}', style: TextStyle(color: Colors.white,fontSize: 14)),
        Text('${salesman.current}', style: TextStyle(color: Colors.white,fontSize: 12)),
      ],
    );
  }
}
