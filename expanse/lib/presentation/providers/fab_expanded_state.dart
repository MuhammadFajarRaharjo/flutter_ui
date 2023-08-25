import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fab_expanded_state.g.dart';

@riverpod
class FabExpandedState extends _$FabExpandedState {
  @override
  bool build() => false;

  void toogle() => state = !state;
}
