import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_appbar.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_button_icon_filled.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/empty_contain.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/product_chart_tile.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Favorite Shoes')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
        child: ListView(
          children: [
            HeightSpacer.from20(),
            ProductChartTile(
              trailing: CustomIconButtonFilled(
                icon: Icons.favorite,
                iconSize: BoxSize.size16,
                buttonSize: 34,
                backgroundColor: AppStyle.blue38,
                onPressed: () {},
              ),
            ),
            ProductChartTile(
              trailing: CustomIconButtonFilled(
                icon: Icons.favorite,
                iconSize: BoxSize.size16,
                buttonSize: 34,
                backgroundColor: AppStyle.blue38,
                onPressed: () {},
              ),
            ),
            ProductChartTile(
              trailing: CustomIconButtonFilled(
                icon: Icons.favorite,
                iconSize: BoxSize.size16,
                buttonSize: 34,
                backgroundColor: AppStyle.blue38,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  EmptyContain _emptyContain() {
    return const EmptyContain(
      title: ' You don\'t have dream shoes?',
      subtitle: 'Let\'s find your favorite shoes',
      imageAsset: Assets.assetsImagesWishlist,
    );
  }
}
