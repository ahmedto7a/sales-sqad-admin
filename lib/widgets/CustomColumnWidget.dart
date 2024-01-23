import 'package:flutter/material.dart';

class CustomColumnWidget extends StatelessWidget {
  final IconData icon;
  final String mainText;
  final String description;
  final TextStyle mainTextStyle;
  final TextStyle descriptionStyle;

  CustomColumnWidget({
    required this.icon,
    required this.mainText,
    required this.description,
    required this.mainTextStyle,
    required this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(
          mainText,
          style: mainTextStyle,
        ),
        Text(
          description,
          style: descriptionStyle,
        ),
      ],
    );
  }
}
