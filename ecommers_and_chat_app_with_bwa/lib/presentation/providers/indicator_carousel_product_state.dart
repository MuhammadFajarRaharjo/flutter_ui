import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'indicator_carousel_product_state.g.dart';

@riverpod
class IndicatorCarouselProductState extends _$IndicatorCarouselProductState {
  @override
  int build() {
    return 0;
  }

  void setState(int index) {
    state = index;
  }
}
