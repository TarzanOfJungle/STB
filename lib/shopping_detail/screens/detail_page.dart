import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

class DetailPage extends StatelessWidget {
  final ShoppingWithContext shopping;
  const DetailPage({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(STANDARD_PADDING),
        child: Column(
          children: [
            Text(shopping.shopping.description ?? ''),
          ],
        ),
      ),
    );
  }
}
