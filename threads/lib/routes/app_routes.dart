import 'package:flutter/material.dart';
import 'package:threads/screens/create/create_screen.dart';
import 'package:threads/screens/main_screen.dart';
import 'package:threads/screens/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const main = '/main';
  static const create = '/create';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case create:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CreateScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween = Tween(begin: begin, end: end);
            var curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
        );
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
