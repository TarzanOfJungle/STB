import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StbNumberInputField extends StatefulWidget {
  final TextEditingController controller;
  final double? fixedWidth;
  final String? Function(String? value)? validator;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final bool allowDecimals;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const StbNumberInputField({
    super.key,
    this.fixedWidth,
    this.label,
    this.onTap,
    this.onChanged,
    this.validator,
    this.prefix,
    this.suffix,
    this.allowDecimals = true,
    required this.controller,
  });

  @override
  State<StbNumberInputField> createState() => _StbNumberInputFieldState();
}

class _StbNumberInputFieldState extends State<StbNumberInputField> {
  final _focusNode = FocusNode();

  RegExp get _inputFormatter {
    // ignore: unnecessary_string_escapes
    return widget.allowDecimals ? RegExp("[0-9\.]") : RegExp("[0-9]");
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fixedWidth != null) {
      return SizedBox(
        width: widget.fixedWidth,
        child: _buildTextField(),
      );
    }
    return _buildTextField();
  }

  Widget _buildTextField() {
    return GestureDetector(
      onTap: widget.onTap,
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        inputFormatters: [
          FilteringTextInputFormatter.allow(_inputFormatter),
        ],
        validator: widget.validator,
        focusNode: _focusNode,
        autocorrect: false,
        keyboardType: TextInputType.number,
        maxLines: 1,
        enableSuggestions: false,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: widget.prefix,
          prefixIconConstraints: const BoxConstraints(minWidth: 35),
          suffix: widget.suffix,
        ),
        onTap: widget.onTap,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
      ),
    );
  }
}
