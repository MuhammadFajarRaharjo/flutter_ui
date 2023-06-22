enum TabMenuState {
  home,
  profile,
  nearby,
  bookmark,
  notification,
  messsage,
  setting,
  help,
  logout,
}

extension TabMenuItemExtension on TabMenuState {
  String get values {
    switch (this) {
      case TabMenuState.home:
        return 'Home';
      case TabMenuState.profile:
        return 'Profile';
      case TabMenuState.nearby:
        return 'Nearby';
      case TabMenuState.bookmark:
        return 'Bookmark';
      case TabMenuState.notification:
        return 'Notification';
      case TabMenuState.messsage:
        return 'Message';
      case TabMenuState.setting:
        return 'Setting';
      case TabMenuState.help:
        return 'Help';
      case TabMenuState.logout:
        return 'Logout';
    }
  }
}
