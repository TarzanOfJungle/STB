import 'package:flutter/material.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../common/constants/ui_constants.dart';
import '../../ioc_container.dart';

const _TILE_HEIGHT = 100.0;

class ShoppingTile extends StatelessWidget {
  final ShoppingWithContext shopping;

  const ShoppingTile({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
    final navRouter = get<NavRouter>();

    return InkWell(
        onTap: () => navRouter.toShoppingDetail(shopping.shopping.id),
        child: SizedBox(
          height: _TILE_HEIGHT,
          child: Padding(
            padding: const EdgeInsets.all(STANDARD_PADDING),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          shopping.shopping.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildAmountDisplay(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Items: ${shopping.numberOfItems}'),
                      Text('Members: ${shopping.numberOfParticipants}'),
                    ],
                  ),
                ]),
          ),
        ));
  }

  Widget _buildAmountDisplay() {
    return Row(
      children: [
        const Icon(UiConstants.ammountIcon),
        const SizedBox(width: SMALL_PADDING,),
        Text('${shopping.ammountSpent}'),
      ],
    );
  }
}
