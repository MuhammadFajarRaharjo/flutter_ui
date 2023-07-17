import 'package:flutter/material.dart';
import 'package:threads/screens/main_screen.dart';
import 'package:threads/screens/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const main = '/main';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => _emptyPage());
    }
  }

  static _emptyPage() {
    return const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
