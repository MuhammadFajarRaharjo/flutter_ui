import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.svg,
    this.keyboardType,
    this.isPassword = false,
  });
  final TextEditingController controller;
  final String title, hintText;
  final String? svg;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.poppinsMedium.copyWith(fontSize: BoxSize.size16),
        ),
        const HeightSpacer(height: 12),
        TextFormField(
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppStyle.navy,
            hintText: hintText,
            hintStyle: AppStyle.poppinsRegular.copyWith(color: AppStyle.grey50),
            prefixIcon:
                svg != null ? SvgPicture.asset(svg!, fit: BoxFit.none) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(BoxSize.radius12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
