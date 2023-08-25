import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.width});
  final double width;

  factory WidthSpacer.from10() => const WidthSpacer(width: 10.0);
  factory WidthSpacer.from5() => const WidthSpacer(width: 5.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
