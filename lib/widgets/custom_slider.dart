import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class CustomSlider extends StatelessWidget {
  final String title;
  final double value;
  final double min;
  final double max;
  final Function(double) onChanged;

  CustomSlider({
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: AppFontSizes.small, color: Colors.grey),
        ),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                onChanged: onChanged,
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.grey,
                thumbColor: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0), // Add some padding
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border:
                    Border.all(color: Colors.black, width: 2.0), // Add border
              ),
              child: Text(
                value.toStringAsFixed(0),
                style: TextStyle(fontSize: AppFontSizes.small),
              ),
            )
          ],
        ),
      ],
    );
  }
}
