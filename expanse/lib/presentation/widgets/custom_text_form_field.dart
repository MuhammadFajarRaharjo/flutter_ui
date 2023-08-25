import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/constant.dart';
import '../style/app_text_style.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.isPasswordType = false,
    this.prefixIcon,
    this.readOnly = false,
  });

  final String hint;
  final TextInputType? keyboardType;
  final bool isPasswordType, readOnly;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecureText;

  @override
  void initState() {
    super.initState();
    obsecureText = widget.isPasswordType;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: widget.hint,
        contentPadding: const EdgeInsets.all(18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kWhite60, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          borderSide: const BorderSide(color: kWhite60, width: 2),
        ),
        suffixIcon: widget.isPasswordType
            ? GestureDetector(
                onTap: () => setState(() => obsecureText = !obsecureText),
                child: Icon(
                  obsecureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kTextSecondary,
                ),
              )
            : widget.prefixIcon,
      ),
      style: interRegular.copyWith(fontSize: 16),
    );
  }
}
