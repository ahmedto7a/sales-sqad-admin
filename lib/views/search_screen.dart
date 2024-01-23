import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/search_controller.dart';
import '../widgets/advanced_custom_button.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_search_bar.dart';
import 'searchWidgets/salesmen_widget.dart';
import 'searchWidgets/task_widget.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController _controller = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back,
        title: 'Search',
        onLeadingPressed: _controller.onAppBarLeadingPressed,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSearchBarAnimation(
              textEditingController: TextEditingController(),
              isOriginalAnimation: false,
              buttonBorderColour: Colors.black45,
              buttonWidget:
                  Container(child: Icon(Icons.manage_search_outlined)),
              onFieldSubmitted: (String value) {
                print("pressed on search icon");
              },
              trailingWidget: Container(child: Icon(Icons.search)),
              secondaryButtonWidget:
                  Container(child: Icon(Icons.manage_search_outlined)),
            ),
            Row(
              children: [
                Obx(() => AdvancedCustomButton(
                    text: "Task",
                    onPressed: () => _controller.onButtonPressed('Task'),
                    borderColor: _controller.selectedButton.value == 'Task'
                        ? AppColors.primaryColor
                        : Colors.grey,
                    height: screenHeight * 0.055,
                    textSize: AppFontSizes.small)),
                SizedBox(
                  width: 10,
                ),
                Obx(() => AdvancedCustomButton(
                    text: "Salesmen",
                    onPressed: () => _controller.onButtonPressed('Salesmen'),
                    borderColor: _controller.selectedButton.value == 'Salesmen'
                        ? AppColors.primaryColor
                        : Colors.grey,
                    height: screenHeight * 0.055,
                    textSize: AppFontSizes.small)),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Obx(() {
              switch (_controller.selectedButton.value) {
                case 'Task':
                  return TaskWidget();
                case 'Salesmen':
                  return SalesmenWidget();
                default:
                  return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
