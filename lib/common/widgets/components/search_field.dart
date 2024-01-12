import 'package:flutter/material.dart';

const _DEFAULT_LABEL = "Search";

class SearchField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onValueChanged;
  final VoidCallback onSearchCleared;

  const SearchField({
    super.key,
    required this.controller,
    required this.onValueChanged,
    required this.onSearchCleared,
    this.label = _DEFAULT_LABEL,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onValueChanged,
      focusNode: _focusNode,
      onTapOutside: (_) => _focusNode.unfocus(),
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {
            widget.controller.clear();
            widget.onSearchCleared();
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(Icons.clear),
        ),
      ),
    );
  }
}
