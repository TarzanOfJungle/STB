import 'package:flutter/material.dart';

class StbTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String? label;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final int maxLines;
  final bool obscureText;
  final bool enableSuggestions;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final ValueChanged<String>? onChanged;

  const StbTextField({
    super.key,
    required this.controller,
    this.label,
    this.onTap,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
  });

  @override
  State<StbTextField> createState() => _StbTextFieldState();
}

class _StbTextFieldState extends State<StbTextField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        focusNode: _focusNode,
        autocorrect: false,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        obscureText: widget.obscureText,
        enableSuggestions: widget.enableSuggestions,
        textCapitalization: widget.textCapitalization,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          labelText: widget.label,
        ),
        onTap: widget.onTap,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
      ),
    );
  }
}
