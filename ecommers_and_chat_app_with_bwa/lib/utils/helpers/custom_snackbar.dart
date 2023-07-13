import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar(
  String message, {
  Color? color,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: color ?? AppStyle.blue2C,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(BoxSize.radius12),
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppStyle.poppinsRegular.copyWith(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    ),
  );
}
