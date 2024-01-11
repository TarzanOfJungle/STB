import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/home/controllers/last_visited_shopping_controller.dart';
import 'package:split_the_bill/home/controllers/statistics_controller.dart';
import 'package:split_the_bill/home/widgets/last_shopping_preview_tile.dart';
import 'package:split_the_bill/home/widgets/monthly_spending_chart.dart';
import 'package:split_the_bill/ioc_container.dart';

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
        IconButton.outlined(
          onPressed: () => _navRouter.toProfile(),
          icon: const Icon(Icons.person),
        ),
        const SizedBox(
          width: STANDARD_PADDING,
        )
      ],
      child: StreamBuilder(
        stream: Rx.combineLatest3(
            _lastVisitedShoppingController.lastVisitedShoppingStream,
            _statisticsController.userMonthlySpending,
            _statisticsController.userSpendingPerShopping,
            (visited, monthly, perShopping) => (
                  lastVisited: visited,
                  monthlySpending: monthly,
                  perShoppingSpending: perShopping,
                )),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: ErrorBanner(),
            );
          }
          if (!snapshot.hasData) {
            return _buildNoData();
          }
          final lastVisitedShopping = snapshot.data!.lastVisited;
          final userMonthlySpending = snapshot.data!.monthlySpending;
          final userSpendingPerShopping = snapshot.data!.perShoppingSpending;

          final noUsableData = lastVisitedShopping == null &&
              userMonthlySpending.isEmpty &&
              userSpendingPerShopping.isEmpty;

          if (noUsableData) {
            return _buildNoData();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(STANDARD_PADDING),
            child: Column(
              children: [
                if (lastVisitedShopping != null)
                  LastShoppingPreviewTile(shopping: lastVisitedShopping),
                _buildMonthlySpendingChart(userMonthlySpending),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoData() {
    return const Center(
      child: Row(
        children: [
          Expanded(
            child: Text(
              _NO_DATA_MESSAGE,
              textAlign: TextAlign.center,
            ),
          ),
        ],
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
}
