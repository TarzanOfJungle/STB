import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/home/models/shopping_with_spending.dart';

const _TITLE = "Your top spendings on shoppings";
const _MAX_HEIGHT = 150.0;
const _MAX_SHOPPINGS = 7;
const _BAR_WIDTH = 15.0;

class PerShoppingSpendingChart extends StatelessWidget {
  final List<ShoppingWithSpending> perShoppingSpending;

  const PerShoppingSpendingChart({
    super.key,
    required this.perShoppingSpending,
  });

  List<ShoppingWithSpending> get _shoppingsFilteredAndSorted =>
      [...perShoppingSpending]
        ..sort((prev, curr) => prev.spending.compareTo(curr.spending))
        ..take(_MAX_SHOPPINGS);

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
            child: BarChart(
              _getBarData(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingsList() {
    return Column();
  }

  BarChartData _getBarData(BuildContext context) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Theme.of(context).colorScheme.primary,
          tooltipRoundedRadius: STANDARD_BORDER_RADIUS,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          getTooltipItem: (group, groupIndex, rod, rodIndex) =>
              _getTooltip(context, groupIndex, rod),
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
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _getBarChartGroupData(context),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Theme.of(context).colorScheme.shadow,
          strokeWidth: 1,
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarChartGroupData(BuildContext context) {
    final List<BarChartGroupData> groups = [];

    for (var i = 0; i < _shoppingsFilteredAndSorted.length; i++) {
      final shoppingWithSpending = _shoppingsFilteredAndSorted[i];
      final color = UiConstants.getChartColorByAnyIndex(i);
      groups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: shoppingWithSpending.spending,
              borderRadius: BorderRadius.circular(30),
              color: color,
              width: _BAR_WIDTH,
            ),
          ],
        ),
      );
    }
    return groups;
  }

  BarTooltipItem _getTooltip(
      BuildContext context, int groupIndex, BarChartRodData rod) {
    final fontColor = Theme.of(context).colorScheme.onPrimary;
    final topText = _shoppingsFilteredAndSorted
            .elementAtOrNull(groupIndex)
            ?.shopping
            .shopping
            .name ??
        "";

    return BarTooltipItem(
      '$topText\n',
      TextStyle(
        color: fontColor,
      ),
      children: [
        TextSpan(
          text: "${rod.toY},-",
          style: TextStyle(
            color: fontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
