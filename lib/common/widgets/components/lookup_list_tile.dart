import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

const _ICON_BACKGROUND_BORDER_RADIUS = 100.0;
const _TILE_PADDING = 7.0;
const _DEFAULT_ICON_SIZE = 15.0;

class LookupListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subtitle;
  final double? iconSize;
  final Color? iconBackgroundColor;
  final VoidCallback onTap;

  const LookupListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.subtitle,
    this.iconSize,
    this.iconBackgroundColor,
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
                color: iconBackgroundColor ??
                    Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                icon,
                size: iconSize ?? _DEFAULT_ICON_SIZE,
              ),
            ),
            const SizedBox(width: STANDARD_PADDING),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
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
