import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/svg_asset.dart';
import 'package:expanse/utils/constants/assets.dart';
import 'package:expanse/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fab_expanded_state.dart';

class FabExpanded extends ConsumerWidget {
  const FabExpanded({super.key});

  final double size = 56;

  @override
  Widget build(BuildContext context, ref) {
    final bool isExpand = ref.watch(fabExpandedStateProvider);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: isExpand ? 180 : size,
      height: isExpand ? 180 : size,
      child: Stack(
        children: [
          //* INCOME BUTTON
          _animatedAlignIconButton(
            alignTarget: Alignment.centerLeft,
            asset: Assets.assetsIconsIncome,
            backgroundColor: kGreen,
            isExpand: isExpand,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.income),
          ),

          //* TRANSFER BUTTON
          _animatedAlignIconButton(
            alignTarget: Alignment.topCenter,
            asset: Assets.assetsIconsCurrencyExchange,
            backgroundColor: kBlue,
            isExpand: isExpand,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.transfer),
          ),

          //* EXPANSE BUTTON
          _animatedAlignIconButton(
            alignTarget: Alignment.centerRight,
            asset: Assets.assetsIconsExpense,
            backgroundColor: kRed,
            isExpand: isExpand,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.expanse),
          ),
        ],
      ),
    );
  }

  AnimatedAlign _animatedAlignIconButton({
    required VoidCallback onPressed,
    required Alignment alignTarget,
    required Color backgroundColor,
    required bool isExpand,
    required String asset,
  }) {
    return AnimatedAlign(
      alignment: isExpand ? alignTarget : Alignment.bottomCenter,
      duration: isExpand
          ? const Duration(milliseconds: 200)
          : const Duration(milliseconds: 500),
      curve: isExpand ? Curves.easeIn : Curves.easeOut,
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: backgroundColor,
        ),
        child: IconButton(
          highlightColor: Colors.white.withOpacity(0.2),
          onPressed: onPressed,
          icon: SvgAsset(
            asset,
            color: kWhite80,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
