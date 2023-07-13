import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/product_chart_count.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button_icon_filled.dart';
import '../../../widgets/empty_contain.dart';
import '../../../widgets/product_chart_tile.dart';

class ChartScreen extends ConsumerWidget {
  ChartScreen({super.key});

  final uniqueKey = UniqueKey();

  @override
  Widget build(BuildContext context, ref) {
    final countProduct = ref.watch(productChartCountProvider(uniqueKey));
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Your Chart'),
        backButton: true,
        onPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => ProductChartTile(
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: CustomIconButtonFilled(
                    buttonSize: 18,
                    iconSize: 15,
                    onPressed: () => ref
                        .read(productChartCountProvider(uniqueKey).notifier)
                        .increment(),
                    icon: Icons.add,
                  ),
                ),
                Text(
                  '$countProduct',
                  style: AppStyle.poppinsMedium,
                ),
                Flexible(
                  child: CustomIconButtonFilled(
                    buttonSize: 18,
                    iconSize: 15,
                    backgroundColor: AppStyle.grey50,
                    onPressed: () => ref
                        .read(productChartCountProvider(uniqueKey).notifier)
                        .decrement(),
                    icon: Icons.remove,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buttonBottom(context),
    );
  }

  Column _buttonBottom(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeightSpacer.from10(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: AppStyle.poppinsRegular.copyWith(fontSize: 14),
              ),
              // ---
              Text(
                '\$287,96',
                style: AppStyle.poppinsSemiBold
                    .copyWith(fontSize: 16, color: AppStyle.blue2C),
              ),
            ],
          ),
        ),
        // HeightSpacer.from10(),
        const Divider(color: AppStyle.darkNavy25, thickness: 2),
        HeightSpacer.from10(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
          child: FilledButton(
            onPressed: () =>
                Navigator.pushNamed(context, RouteName.checkoutDetails),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Continue to Checkout'),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
        HeightSpacer.from30(),
      ],
    );
  }

  //* Digunakan nanti pada saat Chart kosong
  Widget _emptyChart() {
    return const EmptyContain(
      imageAsset: Assets.assetsImagesCart,
      title: 'Opss! Your Cart is Empty',
      subtitle: 'Let\'s find your favorite shoes',
    );
  }
}
