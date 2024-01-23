import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/advanced_custom_button.dart';

class TaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Column(
        children: [
          AdvancedCustomButton(
            text: "Dashboard Unity",
            subtitle: "Design",
            endingWidget: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.greenAccent,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                '10/25',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: AppFontSizes.verySmall,
                ),
              ),
            ),
            bottomWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.people_alt),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                          begin: 0,
                          end:
                              0.47), // Change end value to your desired progress
                      duration:
                          Duration(seconds: 2), // Duration for the animation
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Container(
                          height: 10.0,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: LinearProgressIndicator(
                              value: value, // Use animated value here
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.lightGreen),
                              backgroundColor: Colors.green[100],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {},
            borderColor: AppColors.lightGreyColor,
            textSize: AppFontSizes.small,
            height: screenHeight * 0.13,
          ),
          SizedBox(
            height: 24,
          ),
          AdvancedCustomButton(
            text: "Dashboard Instagram",
            subtitle: "Marketing",
            endingWidget: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.greenAccent,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                '18/30',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: AppFontSizes.verySmall,
                ),
              ),
            ),
            bottomWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.people_alt),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                          begin: 0,
                          end:
                              0.8), // Change end value to your desired progress
                      duration:
                          Duration(seconds: 2), // Duration for the animation
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Container(
                          height: 10.0,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: LinearProgressIndicator(
                              value: value, // Use animated value here
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.orangeAccent),
                              backgroundColor: Colors.orange[100],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {},
            borderColor: AppColors.lightGreyColor,
            textSize: AppFontSizes.small,
            height: screenHeight * 0.13,
          ),
        ],
      ),
    );
  }
}
