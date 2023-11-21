import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/stb_elevated_button.dart';

import '../constants/ui_constants.dart';

class ConfirmationDialog extends StatelessWidget {
  final String label;
  final String? description;
  final void Function() onConfirm;

  const ConfirmationDialog(
      {super.key,
      required this.label,
      this.description,
      required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(STANDARD_BORDER_RADIUS))),
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(description ?? ''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StbElevatedButton(
                text: 'Cancel',
                stretch: true,
                onTap: Navigator.of(context).pop,
              ),
              StbElevatedButton(
                text: 'Do it',
                stretch: true,
                onTap: () {
                  onConfirm;
                  Navigator.of(context).pop;
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
