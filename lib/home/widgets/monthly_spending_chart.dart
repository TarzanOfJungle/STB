import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

// const Map<int, double> _DUMMY_DATA = {
//   1: 5436.2,
//   2: 516.189584,
//   3: 9847.514,
//   4: 0,
//   5: 5110.5145487498746516,
//   6: 1120,
//   7: 112.58,
//   8: 0,
//   9: 148,
//   10: 356.183,
//   11: 125.36,
//   12: 432.2,
// };

const _TITLE = "Your monthly spending";
const _MAX_HEIGHT = 150.0;

class MonthlySpendingChart extends StatelessWidget {
  final Map<int, double> monthlySpending;
  const MonthlySpendingChart({
    super.key,
    required this.monthlySpending,
  });

  MapEntry<int, double> get _highestMonthlySpending => monthlySpending.entries
      .reduce((curr, next) => next.value > curr.value ? next : curr);

  List<FlSpot> get _chartSpots {
    final sortedEntries = monthlySpending.entries.toList()
      ..sort((prev, next) => prev.key.compareTo(next.key));
    return sortedEntries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 20,
        left: 15,
        right: 30,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
          color: Theme.of(context).colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _TITLE,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: _MAX_HEIGHT),
            child: LineChart(
              _getChartData(context),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _getChartData(
    BuildContext context,
  ) {
    final lineColor = Theme.of(context).colorScheme.secondary;
    final fillColor = lineColor.withOpacity(0.2);
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Theme.of(context).colorScheme.shadow,
          strokeWidth: 1,
        ),
      ),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            // getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // interval: 1,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 1,
      maxX: monthlySpending.length.toDouble(),
      minY: 0,
      maxY: _highestMonthlySpending.value,
      lineBarsData: [
        LineChartBarData(
          spots: _chartSpots,
          isCurved: true,
          color: lineColor,
          preventCurveOverShooting: true,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: fillColor,
          ),
        ),
      ],
    );
  }
}
