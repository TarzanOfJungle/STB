import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row_item.dart';

const _BORDER_RADIUS = STANDARD_BORDER_RADIUS;

class ButtonRow extends StatelessWidget {
  final List<ButtonRowItem> buttons;
  final double? fixedWidth;

  ButtonRowItem? get _firstButton => buttons.firstOrNull;
  ButtonRowItem? get _lastButton => buttons.lastOrNull;

  const ButtonRow({
    super.key,
    this.fixedWidth,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    if (fixedWidth == null) {
      return _buildButtonRow(context);
    }
    return SizedBox(
      width: fixedWidth,
      child: _buildButtonRow(context),
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buttons.map((buttonData) {
        return Expanded(
          child: ElevatedButton(
            onPressed: buttonData.onTap,
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: buttonData.backgroundColor ??
                  Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: _getBorderRadius(buttonData),
              ),
            ),
            child: buttonData.buttonChild,
          ),
        );
      }).toList(),
    );
  }

  BorderRadius _getBorderRadius(ButtonRowItem button) {
    final isFirst = button == _firstButton;
    final isLast = button == _lastButton;
    return BorderRadius.horizontal(
      left: isFirst ? const Radius.circular(_BORDER_RADIUS) : Radius.zero,
      right: isLast ? const Radius.circular(_BORDER_RADIUS) : Radius.zero,
    );
  }
}
