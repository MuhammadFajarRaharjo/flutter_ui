import 'package:flutter/material.dart';

import 'common/constants/my_colors.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(background: MyColors.whiteFA),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// class EntryApp extends StatefulWidget {
//   const EntryApp({super.key});

//   @override
//   State<EntryApp> createState() => _EntryAppState();
// }

// class _EntryAppState extends State<EntryApp> with TickerProviderStateMixin {
//   late final MenuProvider menuController;
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => menuController,
//       child: ZoomHomePage(
//         menuScreen: const MenuPage(),
//         constentScreen: Layout(
//           contentBuilder: (cc) => const HomePage(),
//         ),
//       ),
//     );
//   }
// }
