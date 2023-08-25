import 'package:expanse/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/constant.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.isPrimary = true,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
  });

  final bool isPrimary;
  final String text;
  final VoidCallback onPressed;
  final double? width, height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor:
              backgroundColor ?? (isPrimary ? kPrimaryColor : kViolet20),
          foregroundColor: isPrimary ? kWhite80 : kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultRadius),
          ),
          textStyle:
              Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
          padding: const EdgeInsets.symmetric(vertical: kDefaultMargin),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
