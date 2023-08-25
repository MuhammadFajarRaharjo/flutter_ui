import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant.dart';
import '../../widgets/height_spacer.dart';
import '../../widgets/svg_asset.dart';
import '../../widgets/width_spacer.dart';

class FinancialBudget extends StatelessWidget {
  const FinancialBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: const EdgeInsets.all(kDefaultMargin * 2).copyWith(
        top: MediaQuery.paddingOf(context).top + (kDefaultMargin * 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'This Month',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 24,
                  color: Colors.white.withOpacity(0.72),
                ),
          ),
          Column(
            children: [
              Text(
                '2 of 12 Budget is exceeds the limit',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              HeightSPacer.from20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _option(
                    title: 'Shopping',
                    assetIcon: Assets.assetsIconsShoppingBag,
                    backgroundIconColor: kYellow20,
                    iconColor: kYellow,
                  ),
                  _option(
                    title: 'Food',
                    assetIcon: Assets.assetsIconsRestaurant,
                    backgroundIconColor: kRed20,
                    iconColor: kRed,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  Widget _option({
    required String title,
    required String assetIcon,
    required Color iconColor,
    required Color backgroundIconColor,
  }) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(kDefaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kWhite60, width: 2),
          color: kWhite80,
        ),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: backgroundIconColor,
              ),
              padding: const EdgeInsets.all(5),
              child: SvgAsset(
                Assets.assetsIconsSalary,
                color: iconColor,
              ),
            ),
            WidthSpacer.from10(),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
