import 'package:flutter/material.dart';

import '../../utils/constants/box_size.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.width});
  final double width;

  factory WidthSpacer.from10() => const WidthSpacer(width: BoxSize.size10);
  factory WidthSpacer.from20() => const WidthSpacer(width: BoxSize.size20);
  factory WidthSpacer.from30() => const WidthSpacer(width: BoxSize.size30);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
