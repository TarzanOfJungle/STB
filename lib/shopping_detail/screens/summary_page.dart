import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';

import '../../shoppings_list/models/shopping_with_context/shopping_with_context.dart';

class SummaryPage extends StatelessWidget {
  final ShoppingWithContext shopping;
  const SummaryPage({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      showBackButton: true,
      label: 'Shopping Summary',
      child: Center(
        child: Placeholder(),
      ),
    );
  }
}
