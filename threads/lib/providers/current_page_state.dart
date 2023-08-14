import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_page_state.g.dart';

@riverpod
class CurrentPageState extends _$CurrentPageState {
  @override
  int build() => 0;

  void setPage(int index) => state = index;
}
