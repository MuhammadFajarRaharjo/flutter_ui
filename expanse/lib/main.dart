import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/style/app_theme.dart';
import 'package:expanse/utils/widgets/blank_page.dart';
import 'package:expanse/utils/widgets/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/pages/auth/providers/auth_page_state.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(authPageStateProvider).when(
          data: (isAuth) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              initialRoute: isAuth ? AppRoutes.setupPin : AppRoutes.onboarding,
              onGenerateRoute: AppRoutes.generateRoutes,
            );
          },
          loading: () {
            FlutterNativeSplash.remove();
            return const BlankPage();
          },
          error: (error, __) => ErrorPage(message: error.toString()),
        );
  }
}
