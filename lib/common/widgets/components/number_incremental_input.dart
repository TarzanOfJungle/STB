import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';

const _BUTTON_SCALE = 0.8;

class NumberIncrementalInput extends StatelessWidget {
  final TextEditingController controller;
  final double? fixedWidth;
  final String? Function(String? value)? validator;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final bool allowDecimals;
  final ValueChanged<String>? onChanged;
  final VoidCallback onIncremented;
  final VoidCallback onDecremented;
  final Color? incrementButtonColor;
  final Color? decrementButtonColor;

  const NumberIncrementalInput({
    super.key,
    this.fixedWidth,
    this.validator,
    this.label,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.incrementButtonColor,
    this.decrementButtonColor,
    this.allowDecimals = false,
    required this.controller,
    required this.onIncremented,
    required this.onDecremented,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButtonWithBackground(
          onTap: onDecremented,
          icon: Icons.remove_rounded,
          backgroundColor: decrementButtonColor,
          scale: _BUTTON_SCALE,
        ),
        _buildTextInput(),
        IconButtonWithBackground(
          onTap: onIncremented,
          icon: Icons.add_rounded,
          backgroundColor: incrementButtonColor,
          scale: _BUTTON_SCALE,
        ),
      ],
    );
  }

  Widget _buildTextInput() {
    if (fixedWidth != null) {
      return StbNumberInputField(
        controller: controller,
        fixedWidth: fixedWidth,
        label: label,
        allowDecimals: allowDecimals,
        prefix: prefix,
        suffix: suffix,
        onChanged: onChanged,
      );
    }
    return Expanded(
      child: StbNumberInputField(
        controller: controller,
        fixedWidth: fixedWidth,
        label: label,
        allowDecimals: allowDecimals,
        prefix: prefix,
        suffix: suffix,
        onChanged: onChanged,
      ),
    );
  }
}
