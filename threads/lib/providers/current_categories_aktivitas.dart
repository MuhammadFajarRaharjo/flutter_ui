import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_categories_aktivitas.g.dart';

@riverpod
class CurrentCategoriesAktivitas extends _$CurrentCategoriesAktivitas {
  @override
  String build() {
    return 'All';
  }

  setValue(String value) => state = value;
}
