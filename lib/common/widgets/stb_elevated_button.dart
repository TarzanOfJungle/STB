import 'package:flutter/material.dart';

class StbElevatedButton extends StatelessWidget {
  final String? text;
  final IconData? leadingIcon;
  final VoidCallback onTap;
  final Widget? child;
  final bool stretch;

  /// Standard app elevated button
  /// * [text] text of the button
  /// * [leadingIcon] icon that will appear before the text
  /// * [onTap] callback for when the button is tapped
  /// * [stretch] if true, the button will streth to fill max width horizontally
  /// * [child] for custom child of the button (if specified, [text] and [leadingIcon] should be left empty)
  const StbElevatedButton({
    super.key,
    this.text,
    this.leadingIcon,
    required this.onTap,
    this.stretch = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: child ?? _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (leadingIcon != null)
          Row(
            children: [
              Icon(leadingIcon),
              const SizedBox(
                width: 7,
              ),
            ],
          ),
        Text(text ?? ""),
      ],
    );
  }
}
