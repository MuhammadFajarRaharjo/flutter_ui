import 'package:flutter/material.dart';

import '../../utils/constants/box_size.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({super.key, required this.height});
  final double height;

  factory HeightSpacer.from5() => const HeightSpacer(height: BoxSize.size5);
  factory HeightSpacer.from10() => const HeightSpacer(height: BoxSize.size10);
  factory HeightSpacer.from20() => const HeightSpacer(height: BoxSize.size20);
  factory HeightSpacer.from30() => const HeightSpacer(height: BoxSize.size30);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
