// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expanse/presentation/widgets/svg_asset.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backButton = true,
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final bool backButton;
  final Color? backgroundColor, foregroundColor, textColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(color: foregroundColor ?? textColor),
      ),
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading: backButton
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgAsset(
                Assets.assetsIconsArrowLeft,
                color: foregroundColor ?? iconColor ?? kTextPrimary,
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
