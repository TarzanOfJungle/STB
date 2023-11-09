import 'package:flutter/material.dart';

class StbTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String? hint;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final int maxLines;
  final bool obscureText;
  final bool enableSuggestions;
  final TextCapitalization textCapitalization;

  const StbTextField({
    super.key,
    this.hint,
    this.onTap,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<StbTextField> createState() => _StbTextFieldState();
}

class _StbTextFieldState extends State<StbTextField> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: -1,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          child: TextFormField( 
            controller: widget.controller,
            validator: widget.validator,
            focusNode: _focusNode,
            autocorrect: false,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            obscureText: widget.obscureText,
            enableSuggestions: widget.enableSuggestions,
            textCapitalization: widget.textCapitalization,
            decoration: InputDecoration(
              hintText: widget.hint,
              border: InputBorder.none,
            ),
            onTap: widget.onTap,
            onTapOutside: (event) {
              _focusNode.unfocus();
            },
          ),
        ),
      ),
    );
  }
}
