import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_appbar.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/product_chart_tile.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final List<Map<String, dynamic>> lists = [
    {
      'icon': Assets.assetsSvgStoreLocation,
      'title': 'Adidas Store',
      'subtitle': 'Store Location',
    },
    {
      'icon': Assets.assetsSvgLocation,
      'title': 'Marsemoon',
      'subtitle': 'Your Location',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Checkout Details'),
        backButton: true,
        onPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* LIST ITEMS PRODUCT CHECKOUT
              HeightSpacer.from30(),
              _listItems(),

              //* TIMELINE
              HeightSpacer.from30(),
              _timeline(),

              //* PAYMENT SUMMERY
              HeightSpacer.from30(),
              _paymentSummery(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bottomButton(context),
    );
  }

  Container _paymentSummery() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(BoxSize.size20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BoxSize.radius12),
        color: AppStyle.darkNavy25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: AppStyle.poppinsMedium.copyWith(fontSize: BoxSize.size16),
          ),
          HeightSpacer.from5(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Quantity',
                style: AppStyle.poppinsRegular
                    .copyWith(color: AppStyle.grey99, fontSize: BoxSize.size12),
              ),
              Text(
                '2 Items',
                style: AppStyle.poppinsMedium,
              ),
            ],
          ),
          HeightSpacer.from5(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Price',
                style: AppStyle.poppinsRegular
                    .copyWith(color: AppStyle.grey99, fontSize: BoxSize.size12),
              ),
              Text(
                '\$575.96',
                style: AppStyle.poppinsMedium,
              ),
            ],
          ),
          HeightSpacer.from5(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping',
                style: AppStyle.poppinsRegular
                    .copyWith(color: AppStyle.grey99, fontSize: BoxSize.size12),
              ),
              Text(
                'Free',
                style: AppStyle.poppinsMedium,
              ),
            ],
          ),
          HeightSpacer.from5(),
          const Divider(),
          HeightSpacer.from5(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style:
                    AppStyle.poppinsSemiBold.copyWith(color: AppStyle.blue2C),
              ),
              Text(
                '\$575.96',
                style:
                    AppStyle.poppinsSemiBold.copyWith(color: AppStyle.blue2C),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _timeline() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(BoxSize.size20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BoxSize.radius12),
        color: AppStyle.darkNavy25,
      ),
      child: Timeline.tileBuilder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        builder: TimelineTileBuilder.connected(
          itemCount: lists.length,
          nodePositionBuilder: (_, __) => 0,
          indicatorPositionBuilder: (_, __) => 0,
          contentsBuilder: (_, index) => Padding(
            padding: EdgeInsets.only(
              bottom: index == lists.length - 1 ? 0 : BoxSize.size30,
              left: BoxSize.size12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  lists[index]['subtitle'],
                  style: AppStyle.poppinsLight
                      .copyWith(fontSize: 12, color: AppStyle.grey99),
                ),
                const HeightSpacer(height: 2),
                Text(lists[index]['title'], style: AppStyle.poppinsMedium),
              ],
            ),
          ),
          indicatorBuilder: (_, index) => CircleAvatar(
            radius: 20,
            backgroundColor: AppStyle.darkNavy1F,
            child: SvgPicture.asset(lists[index]['icon']),
          ),
          connectorBuilder: (_, index, type) => Connector.dashedLine(
            gap: 5,
            dash: 5,
            color: Colors.white,
            thickness: 2.0,
          ),
        ),
      ),
    );
  }

  Column _listItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'List Items',
          style: AppStyle.poppinsMedium.copyWith(fontSize: 16),
        ),
        //* List item Products
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, index) => ProductChartTile(
            trailing: Text(
              '2 Items',
              style: AppStyle.poppinsRegular.copyWith(
                fontSize: 12,
                color: AppStyle.grey99,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _bottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BoxSize.size30).copyWith(top: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: AppStyle.darkNavy25, thickness: 2),
          HeightSpacer.from20(),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    RouteName.checkoutSuccess,
                  ),
                  child: const Text('Checkout Now'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
