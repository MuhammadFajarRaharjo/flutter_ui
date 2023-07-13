import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../enum/tab_menu_tate.dart';

class TabMenuProvider with ChangeNotifier {
  TabMenuState currentTab = TabMenuState.home;
  final items = [
    {
      'tabItem': TabMenuState.home,
      'iconSelected': Assets.iconHomeEnable,
      'iconUnSelected': Assets.iconHomeDisable,
    },
    {
      'tabItem': TabMenuState.profile,
      'iconSelected': Assets.iconProfileEnable,
      'iconUnSelected': Assets.iconProfileDisable,
    },
    {
      'tabItem': TabMenuState.nearby,
      'iconSelected': Assets.iconNearbyEnable,
      'iconUnSelected': Assets.iconNearbyDisable,
    },
    {
      'tabItem': TabMenuState.bookmark,
      'iconSelected': Assets.iconBookmarkEnable,
      'iconUnSelected': Assets.iconBookmarkDisable,
    },
    {
      'tabItem': TabMenuState.notification,
      'iconSelected': Assets.iconNotificationEnableHasNotif,
      'iconUnSelected': Assets.iconNotificationDisableHasNotif,
    },
    {
      'tabItem': TabMenuState.messsage,
      'iconSelected': Assets.iconMessageEnableHasMessage,
      'iconUnSelected': Assets.iconMessageDisableHasMessage,
    },
    {
      'tabItem': TabMenuState.setting,
      'iconSelected': Assets.iconSettingEnable,
      'iconUnSelected': Assets.iconSettingDisable,
    },
    {
      'tabItem': TabMenuState.help,
      'iconSelected': Assets.iconHelpEnable,
      'iconUnSelected': Assets.iconHelpDisable,
    },
    {
      'tabItem': TabMenuState.logout,
      'iconSelected': Assets.iconLogoutEnable,
      'iconUnSelected': Assets.iconLogoutDisable,
    },
  ];

  void selectTab(TabMenuState tabItem) {
    currentTab = tabItem;
    notifyListeners();
  }
}
