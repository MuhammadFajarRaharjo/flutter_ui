import 'package:ecommers_and_chat_app_with_bwa/utils/helpers/custom_snackbar.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishlist_button_product_state.g.dart';

@riverpod
class WishlistButtonProductState extends _$WishlistButtonProductState {
  @override
  bool build() {
    return false;
  }

  void toogle(BuildContext context) {
    state = !state;
    if (state) {
      showCustomSnackbar('Has been added to the wishlist', context: context);
    } else {
      showCustomSnackbar(
        'Has been removed from the Whishlist',
        context: context,
        color: AppStyle.salmon,
      );
    }
  }
}
