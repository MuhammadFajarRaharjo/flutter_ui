import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/categories_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/products_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product_model.dart';
import 'widgets/categories_item.dart';
import 'widgets/new_arrivals_tile.dart';
import 'widgets/popular_product_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(productsStateProvider);

    return SafeArea(
      child: CustomScrollView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        slivers: [
          _header(),
          SliverToBoxAdapter(child: HeightSpacer.from30()),
          _categories(ref),

          // //* Popular product
          SliverToBoxAdapter(child: HeightSpacer.from30()),
          _popularProduct(products),

          // //* New Arrivals
          SliverToBoxAdapter(child: HeightSpacer.from20()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
              child: Text(
                'New Arrivals',
                style: AppStyle.poppinsSemiBold.copyWith(
                  fontSize: 22,
                  letterSpacing: 0.22,
                ),
              ),
            ),
          ),
          _newArrivals(products),
        ],
      ),
    );
  }

  Widget _newArrivals(List<ProductModel> products) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30)
          .copyWith(top: 14),
      sliver: SliverList.builder(
        itemCount: products.length,
        itemBuilder: (context, index) =>
            NewArrivalsTile(product: products[index]),
      ),
    );
  }

  Widget _popularProduct(List<ProductModel> products) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Text Product List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
            child: Text(
              'Popular Products',
              style: AppStyle.poppinsMedium.copyWith(fontSize: BoxSize.size22),
            ),
          ),
          //* Card popular product
          const HeightSpacer(height: 14),
          SizedBox(
            height: 278,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) => PopularProductCard(
                index: index,
                product: products[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories(WidgetRef ref) {
    final categorie =
        ref.read(categoriesStateProvider.notifier).listCategories();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.builder(
          itemCount: categorie.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoriesItem(
            index: index,
            onTap: () =>
                ref.read(categoriesStateProvider.notifier).setCategories(index),
            text: categorie[index],
            length: 5,
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return SliverPadding(
      padding: const EdgeInsets.all(BoxSize.size30).copyWith(bottom: 0),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Text Name and email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, Alex',
                  style: AppStyle.poppinsSemiBold
                      .copyWith(fontSize: BoxSize.size24),
                ),
                Text(
                  '@alexKeun',
                  style: AppStyle.poppinsRegularSecondary,
                ),
              ],
            ),

            //* User Picture
            const CircleAvatar(
              backgroundColor: AppStyle.darkNavy1F,
              backgroundImage: AssetImage(Assets.assetsImagesUserProfile),
              radius: 24,
            ),
          ],
        ),
      ),
    );
  }
}
