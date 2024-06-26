import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/stb_icon_appbar_button.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/home/controllers/last_visited_shopping_controller.dart';
import 'package:split_the_bill/home/controllers/statistics_controller.dart';
import 'package:split_the_bill/home/models/shopping_with_spending.dart';
import 'package:split_the_bill/home/widgets/last_shopping_preview_tile.dart';
import 'package:split_the_bill/home/widgets/monthly_spending_chart.dart';
import 'package:split_the_bill/home/widgets/per_shopping_spending_chart.dart';
import 'package:split_the_bill/home/widgets/year_filter_chip.dart';
import 'package:split_the_bill/ioc_container.dart';

const _NO_DATA_ICON_SIZE = 100.0;
const _NO_DATA_MESSAGE =
    "Start participating in shoppings in the Shoppings tab.";

class HomePage extends StatelessWidget {
  final _navRouter = get<NavRouter>();
  final _lastVisitedShoppingController = get<LastVisitedShoppingController>();
  final _statisticsController = get<StatisticsController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: 'Home',
      actions: [
        StbIconAppbarButton(
          onPressed: () => _navRouter.toProfile(),
          iconData: Icons.person,
        ),
      ],
      child: StreamBuilderWithHandling(
        stream: Rx.combineLatest3(
            _lastVisitedShoppingController.lastVisitedShoppingStream,
            _statisticsController.userMonthlySpending,
            _statisticsController.perShoppingSpending,
            (visited, monthly, perShopping) => (
                  lastVisited: visited,
                  monthlySpending: monthly,
                  perShoppingSpending: perShopping,
                )),
        buildWhenData: (context, data) {
          final lastVisitedShopping = data.lastVisited;
          final userMonthlySpending = data.monthlySpending;
          final userSpendingPerShopping = data.perShoppingSpending;

          final noUsableData = lastVisitedShopping == null &&
              userMonthlySpending.isEmpty &&
              userSpendingPerShopping.isEmpty;

          if (noUsableData) {
            return _buildNoData();
          }

          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(STANDARD_PADDING),
            children: [
              if (lastVisitedShopping != null)
                Column(
                  children: [
                    LastShoppingPreviewTile(shopping: lastVisitedShopping),
                    const SizedBox(height: STANDARD_PADDING),
                  ],
                ),
              _buildStatistics(
                context: context,
                userMonthlySpending: userMonthlySpending,
                perShoppingSpending: userSpendingPerShopping,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNoData() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(STANDARD_PADDING),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_shopping_cart_rounded,
              size: _NO_DATA_ICON_SIZE,
            ),
            SizedBox(height: STANDARD_PADDING),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _NO_DATA_MESSAGE,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistics({
    required BuildContext context,
    required Map<int, double> userMonthlySpending,
    required List<ShoppingWithSpending> perShoppingSpending,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Statistics",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        _buildYearFilter(),
        _buildMonthlySpendingChart(userMonthlySpending),
        _buildPerShoppingSpendingChart(perShoppingSpending),
      ],
    );
  }

  Widget _buildYearFilter() {
    final activeYears = _statisticsController.activeYears;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...activeYears.map((year) {
                final isSelected = _statisticsController.selectedYear == year;
                return YearFilterChip(
                  year: year,
                  isSelected: isSelected,
                  onTap: () => _statisticsController.setSelectedYear(year),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthlySpendingChart(Map<int, double> userMonthlySpending) {
    if (userMonthlySpending.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        const SizedBox(height: STANDARD_PADDING),
        MonthlySpendingChart(monthlySpending: userMonthlySpending),
      ],
    );
  }

  Widget _buildPerShoppingSpendingChart(
    List<ShoppingWithSpending> perShoppingSpending,
  ) {
    if (perShoppingSpending.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const SizedBox(height: STANDARD_PADDING),
        PerShoppingSpendingChart(
          perShoppingSpending: perShoppingSpending,
        ),
      ],
    );
  }
}
