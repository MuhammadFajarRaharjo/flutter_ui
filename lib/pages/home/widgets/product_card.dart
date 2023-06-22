import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent/common/constants/assets.dart';
import 'package:home_rent/common/helpers/size_config.dart';
import 'package:home_rent/common/styles/app_styles.dart';
import 'package:home_rent/common/styles/box_style.dart';
import 'package:home_rent/common/styles/font_styles.dart';
import 'package:home_rent/pages/detail/house_detail.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.isLast});
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HouseDetail()),
      ),
      child: Container(
        width: 222,
        margin: EdgeInsets.only(
          left: BoxStyle.padding20,
          right: isLast ? BoxStyle.padding20 : 0,
          bottom: BoxStyle.padding20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BoxStyle.borderRadius20),
          boxShadow: [
            BoxShadow(
              spreadRadius: -7,
              offset: const Offset(0, 18),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.24),
            ),
          ],

          //* BACKGROUND IMAGE
          image: const DecorationImage(
            image: AssetImage(Assets.imagesHouseImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            //* LOCATION
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: BoxStyle.padding16,
                  vertical: BoxStyle.padding20,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: BoxStyle.padding8,
                  vertical: BoxStyle.padding4,
                ),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(BoxStyle.borderRadius20),
                    color: Colors.black.withOpacity(0.24)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.iconNearbyDisable,
                      height: 16,
                      width: 16,
                      fit: BoxFit.none,
                    ),
                    const SizedBox(width: BoxStyle.padding8),
                    Text(
                      '1.8 km',
                      style: FontStyles.ralewayRegular12
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            //* SHADOW BACKGROUND BOTTOM
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: SizeConfig.proportionalScreenHeight(23),
                decoration: BoxDecoration(
                  gradient: AppStyles.sinearGradientBlack,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(BoxStyle.borderRadius20),
                  ),
                ),
              ),
            ),

            //* TEXT FOREGROUND BOTTOM
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: BoxStyle.padding20,
                  vertical: BoxStyle.padding18,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dreamslive House',
                      style: FontStyles.ralewayMedium16
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'Kp. Kalapa RT. 03/07',
                      style: FontStyles.ralewayRegular12
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
