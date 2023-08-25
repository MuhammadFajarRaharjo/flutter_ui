import 'package:flutter/material.dart';

class HeightSPacer extends StatelessWidget {
  const HeightSPacer({super.key, required this.height});
  final double height;

  factory HeightSPacer.from30() => const HeightSPacer(height: 30.0);
  factory HeightSPacer.from20() => const HeightSPacer(height: 20.0);
  factory HeightSPacer.from10() => const HeightSPacer(height: 10.0);
  factory HeightSPacer.from5() => const HeightSPacer(height: 5.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
