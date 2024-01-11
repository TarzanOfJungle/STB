import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

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
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, _) =>
                _getBottomTitleWidgets(value.toInt(), context),
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
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
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: lineColor,
          tooltipRoundedRadius: STANDARD_BORDER_RADIUS,
          getTooltipItems: (touchedSpots) => _getTooltipLabels(
            context,
            touchedSpots,
          ),
        ),
      ),
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

  Widget _getBottomTitleWidgets(int monthNumber, BuildContext context) {
    if (monthNumber != 1 && monthNumber % 4 != 0) {
      return const SizedBox.shrink();
    }
    final textStyle = Theme.of(context).textTheme.labelSmall;
    final text = _getMonthShortcut(monthNumber);

    return SideTitleWidget(
      axisSide: AxisSide.bottom,
      child: Text(text, style: textStyle),
    );
  }

  List<LineTooltipItem?> _getTooltipLabels(
      BuildContext context, List<LineBarSpot> spots) {
    final textStyle = TextStyle(color: Theme.of(context).colorScheme.onPrimary);
    return spots.map((chartSpot) {
      final text =
          "${_getMonthShortcut(chartSpot.x.toInt())}: ${chartSpot.y.toStringAsFixed(1)},-";

      return LineTooltipItem(text, textStyle);
    }).toList();
  }

  String _getMonthShortcut(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }
}
