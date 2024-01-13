import 'package:flutter/material.dart';

const _ICON_SIZE = 30.0;

class StbIconAppbarButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;

  const StbIconAppbarButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: _ICON_SIZE,
      ),
    );
  }
}
