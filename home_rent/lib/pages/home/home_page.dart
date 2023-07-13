import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:home_rent/common/constants/my_colors.dart';
import 'package:home_rent/common/helpers/size_config.dart';
import 'package:home_rent/common/provider/tab_menu_provider.dart';
import 'package:home_rent/common/styles/box_style.dart';
import 'package:home_rent/pages/home/menu_page.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

class HomePage extends StatelessWidget {
  final _drawerController = ZoomDrawerController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ChangeNotifierProvider(
      create: (_) => TabMenuProvider(),
      child: ZoomDrawer(
        androidCloseOnBackTap: true,
        angle: 0,
        borderRadius: BoxStyle.borderRadius20,
        controller: _drawerController,
        slideWidth: SizeConfig.proportionalScreenWidth(65),
        mainScreenTapClose: true,
        menuBackgroundColor: MyColors.blue,
        showShadow: false,
        menuScreen: const MenuPage(),
        mainScreen: const MainPage(),
      ),
    );
  }
}
