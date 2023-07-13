import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pc_overflow_state.g.dart';

@riverpod
class PCOverflowVisibleState extends _$PCOverflowVisibleState {
  @override
  bool build({Key? key}) {
    return false;
  }

  void visible() => state = true;
  void hidden() => state = false;
}
