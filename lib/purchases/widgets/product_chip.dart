import 'package:flutter/material.dart';
import 'package:split_the_bill/products/models/product/product.dart';

const _FONT_SIZE = 12.0;
const _BORDER_RADIUS = 6.0;
const _MAX_WIDTH = 150.0;

class ProductChip extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final bool isSelected;

  const ProductChip({
    super.key,
    required this.product,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getDecoration(context),
      constraints: const BoxConstraints(maxWidth: _MAX_WIDTH),
      child: InkWell(
        onTap: onTap,
        child: Text(
          product.name,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: _FONT_SIZE),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration(BuildContext context) {
    final borderColor = Theme.of(context).colorScheme.primary;
    final backgroundColor =
        isSelected ? borderColor : Theme.of(context).colorScheme.surface;

    return BoxDecoration(
      borderRadius: BorderRadius.circular(_BORDER_RADIUS),
      border: Border.all(color: borderColor),
      color: backgroundColor,
    );
  }
}
