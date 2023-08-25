import 'package:expanse/presentation/widgets/custom_app_bar.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:expanse/presentation/widgets/line_chart_balance.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../widgets/pie_chart_balance.dart';
import '../../widgets/svg_asset.dart';
import '../../widgets/tile_recent_transaction.dart';

class FinancialReportDetailPage extends StatefulWidget {
  const FinancialReportDetailPage({super.key});

  @override
  State<FinancialReportDetailPage> createState() =>
      _FinancialReportDetailPageState();
}

class _FinancialReportDetailPageState extends State<FinancialReportDetailPage> {
  bool isLineChart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Financial Report',
        backgroundColor: kWhite80,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: kWhite60, width: 2),
                    ),
                    icon: const SvgAsset(Assets.assetsIconsArrowIosDown),
                    label: const Text('Month'),
                  ),

                  //* CHART BUTTON
                  Row(
                    children: [
                      //* LINE CHART
                      InkWell(
                        onTap: () => setState(() => isLineChart = true),
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(8),
                        ),
                        child: Ink(
                          height: isLineChart ? 45 : 46,
                          width: isLineChart ? 45 : 46,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(8),
                            ),
                            border: isLineChart
                                ? null
                                : Border.all(color: kWhite60, width: 2),
                            color: isLineChart ? kPrimaryColor : null,
                          ),
                          padding: EdgeInsets.all(
                            isLineChart ? 6 : 5,
                          ),
                          child: SvgAsset(
                            Assets.assetsIconsLineChart,
                            color: isLineChart ? kWhite80 : null,
                          ),
                        ),
                      ),

                      //* PIE CHART
                      InkWell(
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(8),
                        ),
                        onTap: () => setState(() => isLineChart = false),
                        child: Ink(
                          height: isLineChart ? 46 : 45,
                          width: isLineChart ? 46 : 45,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(8),
                            ),
                            border: isLineChart
                                ? Border.all(color: kWhite60, width: 2)
                                : null,
                            color: isLineChart ? null : kPrimaryColor,
                          ),
                          padding: EdgeInsets.all(
                            isLineChart ? 5 : 6,
                          ),
                          child: SvgAsset(
                            Assets.assetsIconsPieChart,
                            color: isLineChart ? null : kWhite80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            HeightSPacer.from10(),
            if (isLineChart) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
                child: Text(
                  '\$ 6000',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 200,
                width: double.infinity,
                child: LineChartBalance(),
              ),
            ] else ...[
              HeightSPacer.from30(),
              const PieChartSample2(),
              const HeightSPacer(height: 60),
            ],

            //* Tab bar
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kWhite60,
              ),
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16),
                  splashBorderRadius: BorderRadius.circular(30),
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  isScrollable: false,
                  tabs: const [
                    Tab(text: 'Pending'),
                    Tab(text: 'Complete'),
                  ],
                ),
              ),
            ),
            HeightSPacer.from10(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          side: const BorderSide(color: kWhite60, width: 2),
                        ),
                        icon: const SvgAsset(Assets.assetsIconsArrowIosDown),
                        label: const Text('Month'),
                      ),
                      IconButton.outlined(
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          visualDensity: VisualDensity.standard,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(color: kWhite60, width: 2),
                        ),
                        onPressed: () {},
                        icon:
                            const SvgAsset(Assets.assetsIconsSortHighestLowest),
                      ),
                    ],
                  ),
                  HeightSPacer.from10(),
                  const TileRecentTransaction(
                    margin: EdgeInsets.symmetric(
                      horizontal: kDefaultMargin,
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
                      horizontal: kDefaultMargin,
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
                      horizontal: kDefaultMargin,
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
            ),
          ],
        ),
      ),
    );
  }
}
