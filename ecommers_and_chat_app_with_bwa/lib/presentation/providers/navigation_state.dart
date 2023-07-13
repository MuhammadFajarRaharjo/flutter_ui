import 'package:ecommers_and_chat_app_with_bwa/utils/constants/navigation_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_state.g.dart';

@riverpod
class NavigationState extends _$NavigationState {
  @override
  NavigationPage build() {
    return NavigationPage.home;
  }

  setPage(NavigationPage page) {
    state = page;
  }
}
