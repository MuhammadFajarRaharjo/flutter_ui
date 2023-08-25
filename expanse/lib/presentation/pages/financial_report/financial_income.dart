import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant.dart';
import '../../widgets/height_spacer.dart';
import '../../widgets/svg_asset.dart';
import '../../widgets/width_spacer.dart';

class FinancialIncome extends StatelessWidget {
  const FinancialIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreen,
      padding: const EdgeInsets.all(kDefaultMargin).copyWith(
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
                'You Earned 💰',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
              HeightSPacer.from20(),
              Text(
                '\$6000',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultMargin,
              horizontal: kDefaultMargin * 1.5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              color: kWhite80,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'and your biggest spending is from',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 24),
                ),
                HeightSPacer.from10(),
                _option(),
                const Text('\$ 120', style: TextStyle(fontSize: 36)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _option() {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(kDefaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          border: Border.all(color: kWhite60, width: 2),
        ),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kGreen20,
              ),
              padding: const EdgeInsets.all(5),
              child: const SvgAsset(
                Assets.assetsIconsSalary,
                color: kGreen,
              ),
            ),
            WidthSpacer.from10(),
            const Text(
              'Sallary',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
