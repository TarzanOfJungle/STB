import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

const double _BUTTON_HEIGHT = 40.0;

class ShowSummaryButton extends StatelessWidget {
  final ShoppingWithContext shopping;

  const ShowSummaryButton({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _BUTTON_HEIGHT,
      width: double.maxFinite,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.payment),
        label: const Text('Show summary'),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(STANDARD_BORDER_RADIUS)))),
      ),
    );
  }
}
