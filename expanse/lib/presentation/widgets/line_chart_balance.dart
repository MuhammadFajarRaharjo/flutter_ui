import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class LineChartBalance extends StatelessWidget {
  const LineChartBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(mainData());
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: const FlTitlesData(show: false),
      lineTouchData: const LineTouchData(enabled: false),
      minX: 0,
      maxX: 13,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(13, 2),
          ],
          isCurved: true,
          color: kPrimaryColor,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: gradientFadePurpleReversed,
          ),
        ),
      ],
    );
  }
}
