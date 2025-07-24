import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CreditScoreChart extends StatelessWidget {
  const CreditScoreChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor = theme.colorScheme.secondary;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),

        barGroups: [
          _makeBar(0, 90, barColor),
          _makeBar(1, 95, barColor),
          _makeBar(2, 85, barColor),
          _makeBar(3, 92, barColor),
          _makeBar(4, 78, barColor),
          _makeBar(5, 88, barColor),
          _makeBar(6, 75, barColor),
        ],
      ),
    );
  }

  BarChartGroupData _makeBar(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 15,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
      ],
    );
  }
}
