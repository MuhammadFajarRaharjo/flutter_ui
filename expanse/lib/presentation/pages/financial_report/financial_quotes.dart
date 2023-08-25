import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant.dart';
import '../../widgets/height_spacer.dart';

class FinancialQuotes extends StatelessWidget {
  const FinancialQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: const EdgeInsets.all(kDefaultMargin).copyWith(
        top: MediaQuery.paddingOf(context).top + (kDefaultMargin * 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSPacer(height: 100),
          Text(
            '“Financial freedom is freedom from fear.”',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          HeightSPacer.from10(),
          Text(
            '-Robert Kiyosaki',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 24,
                  color: Colors.white,
                ),
          ),
          const Spacer(),
          CustomFilledButton(
            backgroundColor: kWhite80,
            isPrimary: false,
            text: 'See the full detail',
            onPressed: () => Navigator.popAndPushNamed(
              context,
              AppRoutes.financialReportDetail,
            ),
          ),
        ],
      ),
    );
  }
}
