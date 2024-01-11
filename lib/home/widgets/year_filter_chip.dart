import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

class YearFilterChip extends StatelessWidget {
  final int year;
  final bool isSelected;
  final VoidCallback onTap;

  const YearFilterChip({
    super.key,
    required this.year,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);
    return Padding(
      padding: const EdgeInsets.all(3),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: borderRadius,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: STANDARD_PADDING,
            vertical: 8,
          ),
          child: Text(
            year.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _getTextColor(context), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return isSelected ? colorScheme.secondary : colorScheme.surface;
  }

  Color _getTextColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return isSelected ? colorScheme.background : colorScheme.onBackground;
  }
}
