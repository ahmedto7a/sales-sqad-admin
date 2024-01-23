import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AdvancedCustomButton extends StatelessWidget {
  final String text;
  final String? subtitle;
  final Widget? endingWidget; // Change this to Widget
  final VoidCallback onPressed;
  final Color borderColor;
  final Color buttonColor;
  final double? width;
  final double? height;
  final double textSize;
  final FontWeight? fontWeight;
  bool isSelected;
  final Widget? bottomWidget;

  AdvancedCustomButton({
    required this.text,
    this.subtitle,
    this.endingWidget, // This can now be either an Icon or a Widget
    required this.onPressed,
    this.borderColor = Colors.grey,
    this.buttonColor = Colors.white,
    this.width,
    this.height,
    required this.textSize,
    this.fontWeight,
    this.isSelected = false,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isSelected ? AppColors.primaryColor : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
          side: BorderSide(color: borderColor, width: 1.5), // Use border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Curved edges
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: endingWidget == null
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: endingWidget == null
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            fontSize: textSize,
                            fontWeight: fontWeight), // Use text size and weight
                      ),
                      if (subtitle != null) Text(subtitle!),
                    ],
                  ),
                  if (endingWidget != null)
                    Container(
                      child: endingWidget,
                    ), // Use spread operator here
                ],
              ),
            ),
            if (bottomWidget != null)
              Expanded(child: bottomWidget!), // Add new widget here
          ],
        ),
      ),
    );
  }
}
