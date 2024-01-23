import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leadingIcon;
  final String title;
  final IconData? endIcon;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onEndPressed;

  CustomAppBar({
    this.leadingIcon,
    required this.title,
    this.endIcon,
    this.onLeadingPressed,
    this.onEndPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        color: Colors.black,
        icon: Icon(leadingIcon),
        onPressed: onLeadingPressed,
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        IconButton(
          color: Colors.black,
          icon: Icon(endIcon),
          onPressed: onEndPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
