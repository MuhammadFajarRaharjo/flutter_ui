import 'package:expanse/presentation/widgets/svg_asset.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/constant.dart';
import 'width_spacer.dart';

class CardAccountBalance extends StatelessWidget {
  const CardAccountBalance({
    super.key,
    required this.balance,
    this.isIncome = true,
  });
  final bool isIncome;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.44,
      padding: const EdgeInsets.all(kDefaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadius24),
        color: isIncome ? kGreen : kRed,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              color: kWhite80,
            ),
            padding: const EdgeInsets.all(8),
            child: SvgAsset(
              isIncome ? Assets.assetsIconsIncome : Assets.assetsIconsExpense,
              color: isIncome ? kGreen : kRed,
            ),
          ),
          WidthSpacer.from10(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isIncome ? 'Income' : 'Expanses',
                  style: const TextStyle(color: kWhite80),
                ),
                Text(
                  balance,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: kWhite80),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
