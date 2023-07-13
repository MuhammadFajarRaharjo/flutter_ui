import 'package:flutter/material.dart';

import '../../main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.backButton = false,
    this.actions,
    this.iconBack,
    this.onPressed,
  });

  final Widget title;
  final bool centerTitle, backButton;
  final List<Widget>? actions;
  final IconData? iconBack;
  final VoidCallback? onPressed;

  @override
  Size get preferredSize => Size.fromHeight(
      Theme.of(navigatorKey.currentContext!).appBarTheme.toolbarHeight!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      leading: backButton
          ? Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(iconBack ?? Icons.arrow_back_ios, size: 20),
              ),
            )
          : null,
      elevation: 0,
      titleSpacing: !centerTitle ? -10 : null,
      automaticallyImplyLeading: false,
      leadingWidth: 63,
      title: title,
      actions: actions,
    );
  }
}
