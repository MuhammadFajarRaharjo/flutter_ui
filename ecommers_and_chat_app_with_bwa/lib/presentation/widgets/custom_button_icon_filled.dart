import 'package:flutter/material.dart';

import '../../utils/style/app_style.dart';

class CustomIconButtonFilled extends StatelessWidget {
  const CustomIconButtonFilled({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.buttonSize,
    required this.onPressed,
  });
  final IconData icon;
  final Color? backgroundColor, iconColor;
  final double? iconSize, buttonSize;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor ?? AppStyle.purple,
        foregroundColor: iconColor ?? Colors.white,
        fixedSize: Size(buttonSize ?? 16, buttonSize ?? 16),
        minimumSize: Size(buttonSize ?? 40, buttonSize ?? 40),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        iconSize: iconSize ?? 20,
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
