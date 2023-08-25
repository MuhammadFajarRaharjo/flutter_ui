import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/constant.dart';
import 'svg_asset.dart';

class IconButtonBMS extends StatelessWidget {
  const IconButtonBMS({
    super.key,
    required this.text,
    required this.asset,
    required this.onTap,
  });
  final String text;
  final String asset;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kDefaultRadius),
      onTap: onTap,
      child: Ink(
        width: MediaQuery.sizeOf(context).width / 3 - 20,
        padding: const EdgeInsets.all(kDefaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          color: kViolet20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgAsset(asset),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
