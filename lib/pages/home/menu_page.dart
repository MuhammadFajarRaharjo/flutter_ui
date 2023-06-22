import 'package:flutter/material.dart';
import 'package:home_rent/common/constants/my_colors.dart';
import 'package:home_rent/common/enum/tab_menu_tate.dart';
import 'package:home_rent/pages/home/widgets/tab_item_menu.dart';
import 'package:provider/provider.dart';

import '../../common/provider/tab_menu_provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.read<TabMenuProvider>().items.length,
                itemBuilder: (context, index) {
                  final item = context.read<TabMenuProvider>().items[index];
                  if ((index + 1) % 3 == 0 &&
                      ((index + 1) !=
                          context.read<TabMenuProvider>().items.length)) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TabItemMenu(
                          tabItem: item['tabItem'] as TabMenuState,
                          iconSelected: item['iconSelected'].toString(),
                          iconUnSelected: item['iconUnSelected'].toString(),
                        ),
                        const Divider(color: Colors.white),
                      ],
                    );
                  }

                  return TabItemMenu(
                    tabItem: item['tabItem'] as TabMenuState,
                    iconSelected: item['iconSelected'].toString(),
                    iconUnSelected: item['iconUnSelected'].toString(),
                  );
                },
              ),
            ),
          )
          // ...context.read<TabMenuProvider>().items.map(
          //   (e) {
          //     if (index % 3 == 0) {
          //       return Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           TabItemMenu(
          //             tabItem: e['tabItem'] as TabMenuState,
          //             iconSelected: e['iconSelected'].toString(),
          //             iconUnSelected: e['iconUnSelected'].toString(),
          //           ),
          //           const Divider(color: Colors.white),
          //         ],
          //       );
          //     }
          //     index++;

          //     return TabItemMenu(
          //       tabItem: e['tabItem'] as TabMenuState,
          //       iconSelected: e['iconSelected'].toString(),
          //       iconUnSelected: e['iconUnSelected'].toString(),
          //     );
          //   },
          // ).toList(),
        ],
      ),
    );
  }
}
