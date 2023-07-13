import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/indicator_carousel_product_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/wishlist_button_product_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/helpers/succes_dialog.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/indicator_carousel_product.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: _carouselProduct(context, ref),
      ),
      bottomSheet: _bottomSheet(context, ref),
    );
  }

  Widget _bottomSheet(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.53,
      maxChildSize: 0.8,
      minChildSize: 0.53,
      expand: false,
      builder: (context, scrollController) => Column(
        children: [
          Container(
            width: BoxSize.size30,
            height: 4,
            decoration: BoxDecoration(
              color: AppStyle.grey99,
              borderRadius: BorderRadius.circular(BoxSize.radius12),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              controller: scrollController,
              children: [
                const HeightSpacer(height: 40),
                //* NAME, CATEGORIES RPODUCT AND BUTTON WISHLIST
                _titleProduct(ref, context),
                HeightSpacer.from20(),
                _price(),
                HeightSpacer.from30(),
                _description(),
                HeightSpacer.from30(),
                _familiarShoes(),
              ],
            ),
          ),
          _buttonBottomSheet(context),
        ],
      ),
    );
  }

  Column _familiarShoes() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: BoxSize.size30,
            bottom: BoxSize.size16,
          ),
          child: Text(
            'Familiar Shoes',
            style: AppStyle.poppinsMedium,
          ),
        ),
        SizedBox(
          height: 54,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (_, index) => Container(
              width: 54,
              margin: EdgeInsets.only(
                right: BoxSize.size10,
                left: index == 0 ? BoxSize.size30 : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BoxSize.radius12),
                image: const DecorationImage(
                  image:
                      AssetImage(Assets.assetsImagesProductsBaskeballShoes12),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _buttonBottomSheet(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(BoxSize.size30).copyWith(top: BoxSize.size16),
      child: Row(
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(14),
              visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
              foregroundColor: AppStyle.purple,
              side: const BorderSide(color: AppStyle.purple, width: 2),
            ),
            onPressed: () {},
            child: SvgPicture.asset(Assets.assetsSvgChatButton),
          ),
          WidthSpacer.from10(),
          Expanded(
            child: FilledButton(
              onPressed: () {
                showSuccessDialog(context: context);
              },
              child: const Text('Add to Chart'),
            ),
          ),
        ],
      ),
    );
  }

  Padding _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: AppStyle.poppinsMedium,
          ),
          HeightSpacer.from10(),
          Text(
            'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
            textAlign: TextAlign.justify,
            style: AppStyle.poppinsLight.copyWith(
              color: AppStyle.grey50,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Container _price() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BoxSize.radius12),
        color: AppStyle.navy,
      ),
      padding: const EdgeInsets.all(BoxSize.size16),
      margin: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Price starts from',
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
            ),
          ),
          Text(
            '\$143,98',
            textAlign: TextAlign.right,
            style: AppStyle.poppinsSemiBold.copyWith(
              color: AppStyle.blue2C,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Padding _titleProduct(WidgetRef ref, BuildContext context) {
    final buttonState = ref.watch(wishlistButtonProductStateProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
      child: Row(
        children: [
          //* NAME AND CATEGORIES PRODUCT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TERREX URBAN LOW',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.poppinsSemiBold.copyWith(fontSize: 18),
                ),
                Text(
                  'Hiking',
                  style: AppStyle.poppinsRegular.copyWith(
                    fontSize: 12,
                    color: AppStyle.grey99,
                  ),
                ),
              ],
            ),
          ),
          WidthSpacer.from10(),

          //* BUTTON WISHLIST
          GestureDetector(
            onTap: () => ref
                .read(wishlistButtonProductStateProvider.notifier)
                .toogle(context),
            child: SvgPicture.asset(
              buttonState
                  ? Assets.assetsSvgLoveButtonSelected
                  : Assets.assetsSvgLoveButton,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _carouselProduct(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: BoxSize.proportionalHeight(context, 47),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          //* CAROUSEL PRODUCT IMAGE
          CarouselSlider(
            disableGesture: true,
            items: [
              Image.asset(
                Assets.assetsImagesProductsBaskeballShoes11,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image.asset(
                Assets.assetsImagesProductsBaskeballShoes12,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image.asset(
                Assets.assetsImagesProductsBaskeballShoes13,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
            options: CarouselOptions(
              onPageChanged: (index, reason) => ref
                  .read(indicatorCarouselProductStateProvider.notifier)
                  .setState(index),
              height: double.infinity,
              initialPage: 0,
              enableInfiniteScroll: false,
              clipBehavior: Clip.antiAlias,
              viewportFraction: 1,
            ),
          ),

          //* INDICATOR CAROUSEL
          const Align(
            alignment: Alignment.bottomCenter,
            child: IndicatorCarouselProduct(3),
          ),

          //* BUTTON TOP
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: BoxSize.size20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.black,
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.black,
                  icon: SvgPicture.asset(Assets.assetsSvgCartBlack),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
