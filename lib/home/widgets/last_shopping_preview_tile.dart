import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/finalized_indicator.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

class LastShoppingPreviewTile extends StatelessWidget {
  final ShoppingWithContext shopping;
  LastShoppingPreviewTile({
    super.key,
    required this.shopping,
  });
  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navRouter.toShoppingDetail(shopping.shopping.id),
      borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
        ),
        child: Padding(
          padding: const EdgeInsets.all(STANDARD_PADDING),
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (shopping.shopping.finalized) const FinalizedIndicator(),
            Text(
              shopping.shopping.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        _buildInfoLine(shopping),
        const SizedBox(
          height: SMALL_PADDING,
        ),
        _buildDescription(),
      ],
    );
  }

  Widget _buildInfoLine(ShoppingWithContext shopping) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Amount spent: ${shopping.ammountSpent.toStringAsFixed(1)}'),
        Text('Members: ${shopping.numberOfParticipants}'),
      ],
    );
  }

  Widget _buildDescription() {
    if (shopping.shopping.description != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(),
          const SizedBox(height: SMALL_PADDING),
          Center(
            child: Text(
              shopping.shopping.description!,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
