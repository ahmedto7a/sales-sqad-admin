
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../constants/constants.dart';
import '../controllers/target_status_controller.dart';
import '../models/salesmen.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/advanced_custom_button.dart';

class TargetStatus extends StatelessWidget {
  final TargetStatusController controller;

  TargetStatus({required Salesman salesmen}) : controller = Get.put(TargetStatusController(salesmen));

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Target Status',
        leadingIcon: Icons.arrow_back_ios_rounded,
        onLeadingPressed: controller.onAppBarLeadingPressed,
        endIcon: Icons.add,
        onEndPressed: controller.onAppBarEndPressed,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(alignment: Alignment.center, children: [
            SimpleCircularProgressBar(
              size: 200,
              valueNotifier: controller.valueNotifier2,
              startAngle: 0,
              progressColors: const [Colors.black],
              progressStrokeWidth: 30,
              backColor: AppColors.lightGreyColor,
              backStrokeWidth: 30,
              animationDuration: 6,
              mergeMode: true,
            ),
            SimpleCircularProgressBar(
              size: 200,
              valueNotifier: controller.valueNotifier,
              startAngle: 0,
              fullProgressColor: Colors.green,
              progressColors: const [AppColors.primaryColor],
              progressStrokeWidth: 30,
              backColor: AppColors.lightGreyColor,
              backStrokeWidth: 30,
              animationDuration: 6,
              mergeMode: true,
              onGetText: (double value) {
                return Text(
                  '${value.toInt()}%',
                  style: TextStyle(fontSize: 48),
                );
              },
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey, // Use the color from circleColors
                  ),
                ),
                SizedBox(
                    width: 8.0),
                Text("In Progress"),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors
                        .primaryColor, // Use the color from circleColors
                  ),
                ),
                SizedBox(
                    width: 8.0), // Add some space between the circle and text
                Text("Completed"),
              ],
            ),
          ]),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Monthly',
                      style: TextStyle(
                          fontSize: AppFontSizes.medium,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              AdvancedCustomButton(
                text: 'Done Leads',
                subtitle: "${controller.salesmen.current} completed leads",
                onPressed: controller.onLeadsPressed,
                borderColor: Colors.green,
                endingWidget: Icon(Icons.more_horiz_rounded),
                buttonColor: Colors.white,
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                textSize: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 12,
              ),
              AdvancedCustomButton(
                text: 'New Leads',
                subtitle: "${controller.completed} new leads",
                onPressed: controller.onLeadsPressed,
                endingWidget: Icon(Icons.more_horiz_rounded),
                borderColor: AppColors.primaryColor,
                buttonColor: Colors.white,
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                textSize: 16,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 12,
              ),
              AdvancedCustomButton(
                text: 'Lost Leads',
                subtitle: "${controller.salesmen.current} lost leads",
                onPressed: controller.onLeadsPressed,
                borderColor: Colors.black54,
                endingWidget: Icon(Icons.more_horiz_rounded),
                buttonColor: Colors.white,
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                textSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}