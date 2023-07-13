import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_chart_count.g.dart';

@riverpod
class ProductChartCount extends _$ProductChartCount {
  @override
  int build(Key? key) {
    return 1;
  }

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 1) {
      state--;
    }
  }
}
