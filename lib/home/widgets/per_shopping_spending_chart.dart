import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/home/models/shopping_with_spending.dart';
import 'package:split_the_bill/home/widgets/home_page_chart_container.dart';
import 'package:split_the_bill/home/widgets/per_shopping_spending_list_tile.dart';

const _TITLE = "Your top spendings on shoppings";
const _MAX_SHOPPINGS = 7;
const _BAR_WIDTH = 15.0;

class PerShoppingSpendingChart extends StatelessWidget {
  final List<ShoppingWithSpending> perShoppingSpending;

  const PerShoppingSpendingChart({
    super.key,
    required this.perShoppingSpending,
  });

  List<ShoppingWithSpending> get _shoppingsFilteredAndSorted {
    final sortedFiltered = [...perShoppingSpending]
      ..sort((prev, curr) => curr.spending.compareTo(prev.spending));
    return sortedFiltered.take(_MAX_SHOPPINGS).toList();
  }

  @override
  Widget build(BuildContext context) {
    return HomePageChartContainer(
      title: _TITLE,
      chart: BarChart(
        _getBarData(context),
      ),
      belowChart: _buildShoppingsList(),
    );
  }

  Widget _buildShoppingsList() {
    return Column(
      children: [
        ..._shoppingsFilteredAndSorted.map(
          (shopping) => PerShoppingSpendingListTile(
            shoppingWithSpending: shopping,
            shoppingColor: _getShoppingColor(shopping),
          ),
        ),
      ],
    );
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
            reservedSize: 48,
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
      final color = _getShoppingColor(shoppingWithSpending);
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

  Color _getShoppingColor(ShoppingWithSpending shopping) {
    final index = _shoppingsFilteredAndSorted.indexOf(shopping);
    return UiConstants.getChartColorByAnyIndex(index);
  }
}
