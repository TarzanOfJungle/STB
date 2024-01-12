import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/components/lookup_list_tile.dart';

const _DEFAULT_ANIMATION_DURATION = const Duration(milliseconds: 150);

class AnimatedLookupList<T> extends StatefulWidget {
  final bool isShown;
  final List<T> items;
  final double heightWhenShown;
  final IconData itemIcon;
  final ValueChanged<T> onItemSelected;
  final String Function(T value) getItemTitle;
  final String? Function(T value)? getItemSubtitle;
  final Duration? animationDuration;

  const AnimatedLookupList({
    super.key,
    required this.isShown,
    required this.items,
    required this.heightWhenShown,
    required this.onItemSelected,
    required this.itemIcon,
    required this.getItemTitle,
    this.getItemSubtitle,
    this.animationDuration,
  });

  @override
  State<AnimatedLookupList> createState() => _AnimatedLookupListState<T>();
}

class _AnimatedLookupListState<T> extends State<AnimatedLookupList<T>> {
  @override
  Widget build(BuildContext context) {
    final size = widget.isShown ? widget.heightWhenShown : 0.0;

    return AnimatedSize(
      curve: Curves.easeIn,
      duration: widget.animationDuration ?? _DEFAULT_ANIMATION_DURATION,
      child: SizedBox(
        height: size,
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final value = widget.items[index];
            return LookupListTile(
              title: widget.getItemTitle(value),
              subtitle: widget.getItemSubtitle?.call(value),
              icon: widget.itemIcon,
              onTap: () => widget.onItemSelected(value),
            );
          },
        ),
      ),
    );
  }
}
