import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class CustomSearchBarAnimation extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isOriginalAnimation;
  final Color buttonBorderColour;
  final Widget buttonWidget;
  final Function(String) onFieldSubmitted;
  final Widget trailingWidget;
  final Widget secondaryButtonWidget;

  CustomSearchBarAnimation({
    required this.textEditingController,
    required this.isOriginalAnimation,
    required this.buttonBorderColour,
    required this.buttonWidget,
    required this.onFieldSubmitted,
    required this.trailingWidget,
    required this.secondaryButtonWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBarAnimation(
      hintText: "Search here",
      textEditingController: textEditingController,
      isOriginalAnimation: isOriginalAnimation,
      buttonBorderColour: buttonBorderColour,
      buttonWidget: buttonWidget,
      onFieldSubmitted: onFieldSubmitted,
      trailingWidget: trailingWidget,
      secondaryButtonWidget: secondaryButtonWidget,
    );
  }
}
