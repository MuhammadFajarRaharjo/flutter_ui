import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:expanse/presentation/widgets/line_chart_balance.dart';
import 'package:expanse/presentation/widgets/svg_asset.dart';
import 'package:expanse/presentation/widgets/width_spacer.dart';
import 'package:expanse/utils/constants/colors.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants/assets.dart';
import '../../widgets/card_account_balance.dart';
import '../../widgets/circular_user_picture.dart';
import '../../widgets/tile_recent_transaction.dart';
import 'providers/gradient_home_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      ref
          .read(scrollControllerOffsetProvider.notifier)
          .setOffset(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = ref.watch(gradientHomeStateProvider);
    return Stack(
      children: [
        Container(decoration: BoxDecoration(gradient: gradient)),
        Column(
          children: [
            //* HEADER
            _header(context),

            //* CONTAINT
            _containt(context),
          ],
        ),
      ],
    );
  }

  Expanded _containt(BuildContext context) {
    return Expanded(
      child: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultMargin,
            ),
            child: Text(
              'Spend Frequency',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          //* GRAPH
          const SizedBox(
            height: 200,
            width: double.infinity,
            child: LineChartBalance(),
          ),

          //* TAB BAR
          HeightSPacer.from20(),
          _tabBar(context),

          //* RECENT TRANSACTION
          HeightSPacer.from20(),
          _recentTransaction(context),
          const TileRecentTransaction(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultMargin * 2,
              vertical: kDefaultMargin,
            ),
            title: 'Shopping',
            subtitle: 'Buy some grocery',
            price: '- \$300',
            time: '10:00 AM',
            svgIcon: Assets.assetsIconsShoppingBag,
            iconColor: kYellow,
            backgroundIconColor: kYellow20,
          ),
          const TileRecentTransaction(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultMargin * 2,
              vertical: kDefaultMargin,
            ),
            title: 'Subscription',
            subtitle: 'Disney+, Mola TV',
            price: '- \$50',
            time: '6:00 AM',
            svgIcon: Assets.assetsIconsRecurringBill,
            iconColor: kPrimaryColor,
            backgroundIconColor: kViolet20,
          ),
          const TileRecentTransaction(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultMargin * 2,
              vertical: kDefaultMargin,
            ),
            title: 'Food',
            subtitle: 'Mie Ayam, Bakso',
            price: '- \$10',
            time: '12:20 PM',
            svgIcon: Assets.assetsIconsRestaurant,
            iconColor: kRed,
            backgroundIconColor: kRed20,
          ),
        ],
      ),
    );
  }

  Padding _recentTransaction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recent Transaction',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          FilledButton(
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
            child: const Text('See all'),
          ),
        ],
      ),
    );
  }

  DefaultTabController _tabBar(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SizedBox(
        height: 34,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: TabBar(
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultMargin),
              color: kYellow20,
            ),
            indicatorWeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: kYellow,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
            unselectedLabelColor: kTextSecondary,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
            labelPadding: const EdgeInsets.symmetric(horizontal: 24),
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            tabs: const [
              Tab(text: 'Today'),
              Tab(text: 'Week'),
              Tab(text: 'Mouth'),
              Tab(text: 'Year'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultMargin)
          .copyWith(top: MediaQuery.paddingOf(context).top),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kDefaultRadius),
        ),
        gradient: gradientCream,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //* APPBAR
          _appBar(context),

          //* TEXT ACCOUNT BALANCE
          HeightSPacer.from5(),
          const Text(
            'Account Balance',
            style: TextStyle(color: kTextSecondary),
          ),
          HeightSPacer.from5(),
          Text(
            '\$9000',
            style: Theme.of(context).textTheme.headlineLarge,
          ),

          //* INFORMATION ACCOUNT BALANCE
          const HeightSPacer(height: 25),
          _informationAccountBalance(context),
        ],
      ),
    );
  }

  Widget _informationAccountBalance(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* CARD INCOME
        CardAccountBalance(balance: '\$5000'),

        //* CARD EXPANSES
        CardAccountBalance(balance: '\$2000', isIncome: false),
      ],
    );
  }

  Widget _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CirculatUserPicture(radius: 16),
        Row(
          children: [
            const SvgAsset(
              Assets.assetsIconsArrowIosDown,
              width: 15,
            ),
            WidthSpacer.from5(),
            const Text('Oktober'),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const SvgAsset(Assets.assetsIconsNotifiaction),
        ),
      ],
    );
  }
}
