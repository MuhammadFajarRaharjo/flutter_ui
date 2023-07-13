import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent/common/constants/my_colors.dart';
import 'package:home_rent/common/styles/box_style.dart';
import 'package:home_rent/common/styles/font_styles.dart';

import '../../../common/constants/assets.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: BoxStyle.padding24),
      height: 70,
      child: Row(
        children: [
          //* Image
          ClipRRect(
            borderRadius: BorderRadius.circular(BoxStyle.borderRadius10),
            child: Image.asset(Assets.imagesHouseImage, width: 74),
          ),
          const SizedBox(width: BoxStyle.padding20),
          //* TEXT HOUSE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Orcad House', style: FontStyles.ralewayMedium16),
              Text(
                'Rp. 2.500.000.000 / Year',
                style:
                    FontStyles.ralewayRegular12.copyWith(color: MyColors.blue),
              ),
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.iconBedroom),
                      const SizedBox(width: BoxStyle.padding6),
                      Text(
                        '6 Beadroom',
                        style: FontStyles.ralewayMedium12
                            .copyWith(color: MyColors.grey85),
                      ),
                    ],
                  ),
                  const SizedBox(width: BoxStyle.padding10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.iconBathroom),
                      const SizedBox(width: BoxStyle.padding6),
                      Text(
                        '4 Bathroom',
                        style: FontStyles.ralewayMedium12
                            .copyWith(color: MyColors.grey85),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
