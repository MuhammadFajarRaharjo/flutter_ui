import 'package:flutter/material.dart';
import 'package:home_rent/common/constants/my_colors.dart';
import 'package:home_rent/pages/home/widgets/product_card.dart';
import 'package:home_rent/pages/home/widgets/product_list.dart';

import '../../common/styles/box_style.dart';
import '../../common/styles/font_styles.dart';

class PageViewProduct extends StatelessWidget {
  const PageViewProduct({
    super.key,
    required this.pageController,
    required this.categories,
  });

  final PageController pageController;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (_, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: BoxStyle.padding20)
                      .copyWith(
                top: BoxStyle.padding22,
                bottom: BoxStyle.padding24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Near from you',
                    style: FontStyles.ralewayMedium16,
                  ),
                  Text(
                    'See more',
                    style: FontStyles.ralewayRegular12
                        .copyWith(color: MyColors.grey85),
                  ),
                ],
              ),
            ),

            //* CARD HOME HORIZONTAL
            /// Nilai seharusnya 272
            /// ditambahkan dengan margin bottom PriductCard yitu 20
            SizedBox(
              height: 292,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => ProductCard(isLast: index == 3),
              ),
            ),

            /// list vertical
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: BoxStyle.padding20)
                      .copyWith(top: BoxStyle.padding16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best for you',
                    style: FontStyles.ralewayMedium16,
                  ),
                  Text(
                    'See more',
                    style: FontStyles.ralewayRegular12
                        .copyWith(color: MyColors.grey85),
                  ),
                ],
              ),
            ),

            //* HOUSE LIST VERTICAL
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: BoxStyle.padding20,
                ),
                itemCount: 8,
                itemBuilder: (_, __) => const ProductList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
