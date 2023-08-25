import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/constants/colors.dart';

part 'gradient_home_state.g.dart';

@riverpod
class ScrollControllerOffset extends _$ScrollControllerOffset {
  @override
  double build() {
    return 0;
  }

  void setOffset(double offset) => state = offset;
}

@riverpod
LinearGradient gradientHomeState(GradientHomeStateRef ref) {
  final offset = ref.watch(scrollControllerOffsetProvider);

  return gradientFadePurple.scale(
    (offset / 50).clamp(0.0, 1.0),
  );
}
