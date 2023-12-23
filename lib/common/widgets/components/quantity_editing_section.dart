import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/set_text_editing_controller_value.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row_item.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';

const _INCREMENT_BUTTONS_WIDTH = 120.0;

class QuantityEditingSection extends StatefulWidget {
  final String label;
  final int? currentValue;
  final bool incrementEnabled;
  final bool decrementEnabled;
  final ValueChanged<int?> onQuantityChanged;

  const QuantityEditingSection({
    super.key,
    required this.label,
    this.currentValue,
    this.incrementEnabled = true,
    this.decrementEnabled = true,
    required this.onQuantityChanged,
  });

  @override
  State<QuantityEditingSection> createState() => _QuantityEditingSectionState();
}

class _QuantityEditingSectionState extends State<QuantityEditingSection> {
  final _quantityEditingController = TextEditingController();

  @override
  void dispose() {
    _quantityEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _setTextEditingControllerValue(widget.currentValue?.toString());

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: StbNumberInputField(
            controller: _quantityEditingController,
            label: "Quantity",
            prefix: const Icon(
              UiConstants.quantityIcon,
              size: 15,
            ),
            onChanged: (value) {
              final quantity = int.tryParse(value);
              widget.onQuantityChanged(quantity);
            },
          ),
        ),
        const SizedBox(width: STANDARD_PADDING),
        ButtonRow(
          fixedWidth: _INCREMENT_BUTTONS_WIDTH,
          buttons: [
            ButtonRowItem(
              enabled: widget.decrementEnabled,
              buttonChild: const Icon(Icons.remove_rounded),
              onTap: () => _addToQuantity(-1),
            ),
            ButtonRowItem(
              enabled: widget.incrementEnabled,
              buttonChild: const Icon(Icons.add_rounded),
              onTap: () => _addToQuantity(1),
            ),
          ],
        ),
      ],
    );
  }

  void _setTextEditingControllerValue(String? value) {
    _quantityEditingController.setValue(value);
  }

  void _addToQuantity(int quantityToAdd) {
    final quantityToAddTo = widget.currentValue;
    final newQuantity = (quantityToAddTo ?? 0) + quantityToAdd;
    widget.onQuantityChanged(newQuantity);
  }
}
