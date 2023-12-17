import 'package:flutter/material.dart';

class GeneralInfoLabel extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Widget? trailingButton;

  const GeneralInfoLabel({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.trailingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 25,
                ),
                const SizedBox(width: 5),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        if (trailingButton != null) trailingButton!
      ],
    );
  }
}
