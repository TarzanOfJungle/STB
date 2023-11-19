import 'package:flutter/material.dart';

class StbElevatedButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final IconData? leadingIcon;
  final VoidCallback onTap;
  final Widget? child;
  final bool stretch;
  final bool enabled;

  /// Standard app elevated button
  /// * [text] text of the button
  /// * [color] background color of the button, if left null, default is used
  /// * [leadingIcon] icon that will appear before the text
  /// * [onTap] callback for when the button is tapped
  /// * [stretch] if true, the button will streth to fill max width horizontally
  /// * [enabled] if false, the button will not be clickable
  /// * [child] for custom child of the button (if specified, [text] and [leadingIcon] should be left empty)
  const StbElevatedButton({
    super.key,
    this.text,
    this.color,
    this.leadingIcon,
    required this.onTap,
    this.stretch = false,
    this.enabled = true,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onTap : null,
      style: ElevatedButton.styleFrom(backgroundColor: color),
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
