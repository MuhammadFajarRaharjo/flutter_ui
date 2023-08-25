import 'package:expanse/utils/constants/constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setup_success_sate.g.dart';

@riverpod
class SetupSuccessState extends _$SetupSuccessState {
  @override
  FutureOr<bool> build() async {
    final sharedPref = await SharedPreferences.getInstance();
    final value = sharedPref.getBool(setupSuccesKey);
    return value ?? false;
  }

  Future<void> setStatus(bool status) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(setupSuccesKey, status);
  }
}
