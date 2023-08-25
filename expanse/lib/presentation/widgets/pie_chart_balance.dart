import 'package:expanse/utils/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatelessWidget {
  const PieChartSample2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: kPrimaryColor,
            value: 40,
            showTitle: false,
          );
        case 1:
          return PieChartSectionData(
            color: kYellow,
            value: 30,
            showTitle: false,
          );
        case 2:
          return PieChartSectionData(
            color: kGreen,
            value: 30,
            showTitle: false,
          );
        default:
          throw Error();
      }
    });
  }
}
