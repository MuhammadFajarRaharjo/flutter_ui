import 'package:expanse/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kPrimaryColor,
        padding: const EdgeInsets.all(30),
        child: Text(
          message,
          style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: kWhite80),
        ),
      ),
    );
  }
}
