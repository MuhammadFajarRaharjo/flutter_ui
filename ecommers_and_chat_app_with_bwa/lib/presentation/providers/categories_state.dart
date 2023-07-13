import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_state.g.dart';

@riverpod
class CategoriesState extends _$CategoriesState {
  @override
  int build() {
    return 0;
  }

  void setCategories(int index) => state = index;

  List<String> listCategories() {
    return [
      'All Shoes',
      'Runing',
      'Training',
      'Basketball',
      'Hiking',
    ];
  }
}
