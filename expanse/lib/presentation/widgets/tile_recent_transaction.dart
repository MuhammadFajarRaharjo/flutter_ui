import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/constant.dart';
import 'height_spacer.dart';
import 'svg_asset.dart';
import 'width_spacer.dart';

class TileRecentTransaction extends StatelessWidget {
  const TileRecentTransaction({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.time,
    required this.svgIcon,
    required this.iconColor,
    required this.backgroundIconColor,
    this.margin,
  });

  final String title, price, subtitle, time, svgIcon;
  final Color iconColor, backgroundIconColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              color: backgroundIconColor,
            ),
            padding: const EdgeInsets.all(13),
            child: SvgAsset(
              svgIcon,
              color: iconColor,
            ),
          ),
          WidthSpacer.from10(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const WidthSpacer(width: 15),
                    Text(
                      price,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16, color: kRed),
                    ),
                  ],
                ),
                HeightSPacer.from5(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: kTextSecondary,
                        ),
                      ),
                    ),
                    const WidthSpacer(width: 15),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 13,
                        color: kTextSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
