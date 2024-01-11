import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

const _MAX_CHART_HEIGHT = 150.0;

class HomePageChartContainer extends StatelessWidget {
  final String title;
  final Widget chart;
  final Widget? belowChart;

  const HomePageChartContainer({
    super.key,
    required this.title,
    required this.chart,
    this.belowChart,
  });

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
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: _MAX_CHART_HEIGHT),
            child: chart,
          ),
          _buildBelowChart(),
        ],
      ),
    );
  }

  Widget _buildBelowChart() {
    if (belowChart == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        const SizedBox(height: 40),
        belowChart!,
      ],
    );
  }
}
