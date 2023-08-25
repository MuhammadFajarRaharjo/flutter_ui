import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_bar_state.g.dart';

@riverpod
class BottomNavBarState extends _$BottomNavBarState {
  @override
  int build() {
    return 0;
  }

  void setPage(int index) => state = index;
}
