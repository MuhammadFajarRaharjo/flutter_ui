import 'package:expanse/utils/constants/constant.dart';
import 'package:flutter/material.dart';

showAppModalBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(kDefaultMargin).copyWith(top: 0),
      child: child,
    ),
  );
}
