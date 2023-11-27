import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/products/models/product/product.dart';

const _ICON_BACKGROUND_BORDER_RADIUS = 100.0;
const _ICON_SIZE = 15.0;
const _TILE_PADDING = 7.0;

class ProductLookupListTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductLookupListTile({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(_TILE_PADDING),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(SMALL_PADDING),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(_ICON_BACKGROUND_BORDER_RADIUS),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Icon(
                Icons.add_shopping_cart_rounded,
                size: _ICON_SIZE,
              ),
            ),
            const SizedBox(width: STANDARD_PADDING),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (product.description != null)
                    Text(
                      product.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
