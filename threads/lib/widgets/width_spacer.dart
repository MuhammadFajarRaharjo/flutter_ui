import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer(this.width, {super.key});
  final double width;

  factory WidthSpacer.from5() => const WidthSpacer(5);
  factory WidthSpacer.from10() => const WidthSpacer(10);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
