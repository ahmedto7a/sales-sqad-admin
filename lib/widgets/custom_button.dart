import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final double width;
  final double height;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.backgroundColor,
    required this.fontSize,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize,color: Colors.white),
        ),
      ),
    );
  }
}
