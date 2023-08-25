import 'package:expanse/presentation/pages/financial_report/financial_budget.dart';
import 'package:expanse/presentation/pages/financial_report/financial_expanse.dart';
import 'package:expanse/presentation/pages/financial_report/financial_income.dart';
import 'package:expanse/presentation/pages/financial_report/financial_quotes.dart';
import 'package:expanse/utils/constants/colors.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:flutter/material.dart';

class FinancialReportPage extends StatefulWidget {
  const FinancialReportPage({super.key});

  @override
  State<FinancialReportPage> createState() => _FinancialReportPageState();
}

class _FinancialReportPageState extends State<FinancialReportPage> {
  late final PageController _pageController;
  int currentPage = 0;
  final List<Widget> listPage = const [
    //* FINANCIAL EXPANSE
    FinancialExpanse(),
    FinancialIncome(),
    FinancialBudget(),
    FinancialQuotes(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) => setState(() => currentPage = value),
            children: listPage,
          ),

          //* INDICATOR
          _indicator(context),
        ],
      ),
    );
  }

  Padding _indicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultMargin).copyWith(
        top: MediaQuery.paddingOf(context).top + kDefaultMargin,
      ),
      child: SizedBox(
        height: 4,
        child: ListView.builder(
          itemCount: listPage.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Container(
            width: ((MediaQuery.sizeOf(context).width - kDefaultMargin * 2) /
                    listPage.length) -
                (4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              color: index <= currentPage
                  ? kWhite80
                  : Colors.white.withOpacity(0.24),
            ),
            margin: index == listPage.length - 1
                ? EdgeInsets.zero
                : const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.symmetric(vertical: double.infinity),
          ),
        ),
      ),
    );
  }
}
