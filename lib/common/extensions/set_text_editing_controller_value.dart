import 'package:flutter/material.dart';

extension SetTextEditingControllerValue on TextEditingController {
  void setValue(String? newValue) {
    text = newValue ?? "";
    selection = TextSelection.collapsed(
      offset: text.length,
    );
  }
}