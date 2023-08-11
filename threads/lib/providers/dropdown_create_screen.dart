import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dropdown_create_screen.g.dart';

@riverpod
class DropdownCreateScreen extends _$DropdownCreateScreen {
  @override
  String build() {
    return 'Semua orang';
  }

  void setValue(String value) {
    state = value;
  }
}
