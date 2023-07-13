import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent/common/enum/tab_menu_tate.dart';
import 'package:home_rent/common/provider/tab_menu_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/constants/my_colors.dart';
import '../../../common/styles/box_style.dart';
import '../../../common/styles/font_styles.dart';

class TabItemMenu extends StatelessWidget {
  const TabItemMenu({
    super.key,
    required this.tabItem,
    required this.iconSelected,
    required this.iconUnSelected,
  });
  final TabMenuState tabItem;
  final String iconSelected;
  final String iconUnSelected;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<TabMenuProvider>().currentTab == tabItem;
    return GestureDetector(
      onTap: () => context.read<TabMenuProvider>().selectTab(tabItem),
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: BoxStyle.padding4),
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(
          horizontal: BoxStyle.padding24,
          vertical: BoxStyle.padding10,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(BoxStyle.borderRadius20),
          ),
          color: isSelected ? Colors.white : null,
        ),
        child: Row(
          children: [
            SvgPicture.asset(isSelected ? iconSelected : iconUnSelected),
            const SizedBox(width: BoxStyle.padding16),
            Text(
              tabItem.name,
              style: FontStyles.ralewayMedium16
                  .copyWith(color: isSelected ? MyColors.blue : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
