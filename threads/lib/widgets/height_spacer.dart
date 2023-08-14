import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer(this.height, {super.key});
  final double height;

  factory HeightSpacer.from5() => const HeightSpacer(5);
  factory HeightSpacer.from8() => const HeightSpacer(8);
  factory HeightSpacer.from10() => const HeightSpacer(10);
  factory HeightSpacer.from16() => const HeightSpacer(16);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
