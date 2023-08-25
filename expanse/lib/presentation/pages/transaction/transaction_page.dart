import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:expanse/presentation/widgets/tile_recent_transaction.dart';
import 'package:expanse/presentation/widgets/width_spacer.dart';
import 'package:expanse/utils/constants/colors.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';
import '../../widgets/svg_asset.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: _listTransaction(context),
        ),
      ),
    );
  }

  Column _listTransaction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today', style: Theme.of(context).textTheme.bodyLarge),
        HeightSPacer.from10(),
        const TileRecentTransaction(
          margin: EdgeInsets.all(kDefaultMargin),
          title: 'Shopping',
          subtitle: 'Buy some grocery',
          price: '- \$300',
          time: '10:00 AM',
          svgIcon: Assets.assetsIconsShoppingBag,
          iconColor: kYellow,
          backgroundIconColor: kYellow20,
        ),
        const TileRecentTransaction(
          margin: EdgeInsets.all(kDefaultMargin),
          title: 'Subscription',
          subtitle: 'Disney+, Mola TV',
          price: '- \$50',
          time: '6:00 AM',
          svgIcon: Assets.assetsIconsRecurringBill,
          iconColor: kPrimaryColor,
          backgroundIconColor: kViolet20,
        ),
        const TileRecentTransaction(
          margin: EdgeInsets.all(kDefaultMargin),
          title: 'Food',
          subtitle: 'Mie Ayam, Bakso',
          price: '- \$10',
          time: '12:20 PM',
          svgIcon: Assets.assetsIconsRestaurant,
          iconColor: kRed,
          backgroundIconColor: kRed20,
        ),
        Text('Yesterday', style: Theme.of(context).textTheme.bodyLarge),
        const TileRecentTransaction(
          margin: EdgeInsets.all(kDefaultMargin),
          title: 'Transportation',
          subtitle: 'Changing tesla',
          price: '- \$18',
          time: '9:00 AM',
          svgIcon: Assets.assetsIconsCar,
          iconColor: kBlue,
          backgroundIconColor: kBlue20,
        ),
        const TileRecentTransaction(
          margin: EdgeInsets.all(kDefaultMargin),
          title: 'Salary',
          subtitle: 'Salary for july',
          price: '+ \$5000',
          time: '10:20 PM',
          svgIcon: Assets.assetsIconsSalary,
          iconColor: kGreen,
          backgroundIconColor: kGreen20,
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leadingWidth: 120,
      scrolledUnderElevation: 0,
      leading: Container(
        margin: const EdgeInsets.only(left: kDefaultMargin),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextButton.icon(
          onPressed: () {},
          style: TextButton.styleFrom(
            side: const BorderSide(color: kWhite60, width: 2),
          ),
          icon: const SvgAsset(Assets.assetsIconsArrowIosDown),
          label: const Text('Month'),
        ),
      ),
      actions: [
        IconButton.outlined(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            visualDensity: VisualDensity.standard,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(color: kWhite60, width: 2),
          ),
          onPressed: () => _modalBottomSheet(context),
          icon: const SvgAsset(Assets.assetsIconsSort),
        ),
        const WidthSpacer(width: kDefaultMargin),
      ],
      bottom: _buttonFinancialReport(context),
    );
  }

  PreferredSize _buttonFinancialReport(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultMargin)
            .copyWith(bottom: kDefaultMargin),
        child: InkWell(
          borderRadius: BorderRadius.circular(kDefaultRadius),
          onTap: () => Navigator.pushNamed(context, AppRoutes.financialReport),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              color: kViolet20,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultMargin,
              vertical: 12,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'See your financial report',
                  style: TextStyle(color: kPrimaryColor, fontSize: 16),
                ),
                SvgAsset(Assets.assetsIconsArrowIosRight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _modalBottomSheet(BuildContext context) {
    showAppModalBottomSheet(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* RESET FILTER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter Transaction',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: kViolet20,
                  foregroundColor: kPrimaryColor,
                  visualDensity: const VisualDensity(
                    horizontal: 0,
                    vertical: -2,
                  ),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                child: const Text('Reset'),
              ),
            ],
          ),

          //* FILTER BY
          HeightSPacer.from10(),
          Text(
            'Filter By',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          HeightSPacer.from10(),
          Row(
            children: [
              _option(text: 'Income', isSelected: true),
              WidthSpacer.from10(),
              _option(text: 'Expanse'),
              WidthSpacer.from10(),
              _option(text: 'Transfer'),
            ],
          )

          //* SORT BY
          ,
          HeightSPacer.from10(),
          Text(
            'Sort By',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          HeightSPacer.from10(),
          Wrap(
            children: [
              _option(text: 'Highest'),
              WidthSpacer.from10(),
              _option(text: 'Lowest'),
              WidthSpacer.from10(),
              _option(text: 'Newest'),
              WidthSpacer.from10(),
              _option(text: 'Oldest', isSelected: true),
            ],
          ),

          //* CATEGORY
          Text(
            'Category',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Choose Category'),
              TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('0 Selected'),
                    SvgAsset(Assets.assetsIconsArrowIosRight),
                  ],
                ),
              ),
            ],
          ),

          //* BUTTON APPLY
          CustomFilledButton(text: 'Apply', onPressed: () {}),
        ],
      ),
    );
  }

  Container _option({required String text, bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: kDefaultMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultRadius),
        border: isSelected ? null : Border.all(color: kWhite60, width: 2),
        color: isSelected ? kViolet20 : null,
      ),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? kPrimaryColor : null),
      ),
    );
  }
}
