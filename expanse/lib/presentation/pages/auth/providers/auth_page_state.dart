import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constants/constant.dart';

part 'auth_page_state.g.dart';

@riverpod
class AuthPageState extends _$AuthPageState {
  @override
  FutureOr<bool> build() async {
    final sharedPref = await SharedPreferences.getInstance();
    final isAuth = sharedPref.getBool(isAuthKey);

    return isAuth ?? false;
  }

  Future<void> setAuth(bool status) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(isAuthKey, status);
  }
}
