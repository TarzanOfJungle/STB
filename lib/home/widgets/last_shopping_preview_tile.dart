import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../common/navigation/nav_router.dart';
import '../../ioc_container.dart';

const _NO_SHOPPING_MESSAGE = "No recent shopping found";

class LastShoppingPreviewTile extends StatelessWidget {
  LastShoppingPreviewTile({super.key});

  final _shoppingDetailController = get<ShoppingDetailController>();
  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _shoppingDetailController.shopping,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            var errorText = snapshot.error.toString();
            return _buildTileContainer(
              context,
              Center(child: Text(errorText)),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return _buildTileContainer(
              context,
              const Center(child: Text(_NO_SHOPPING_MESSAGE)),
            );
          }
          var shopping = snapshot.data!;
          return InkWell(
              onTap: () => _navRouter.toShoppingDetail(shopping.shopping.id),
              child: _buildTileContainer(
                context,
                _buildContainerBody(context, shopping),
              ));
        });
  }

  Widget _buildTileContainer(BuildContext context, Widget body) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
      ),
      child: Padding(
        padding: const EdgeInsets.all(STANDARD_PADDING),
        child: body,
      ),
    );
  }

  Widget _buildContainerBody(BuildContext context, ShoppingWithContext shopping) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shopping.shopping.name,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildInfoLine(shopping),
        const SizedBox(
          height: SMALL_PADDING,
        ),
        const Divider(),
        const SizedBox(
          height: SMALL_PADDING,
        ),
        _buildDescriptionPart(shopping),
      ],
    );
  }

  Widget _buildInfoLine(ShoppingWithContext shopping) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Amount spent: ${shopping.ammountSpent}'),
        Text('Members: ${shopping.numberOfParticipants}'),
      ],
    );
  }

  Widget _buildDescriptionPart(ShoppingWithContext shopping) {
    return Center(child: Text(shopping.shopping.description ?? ''));
  }
}
