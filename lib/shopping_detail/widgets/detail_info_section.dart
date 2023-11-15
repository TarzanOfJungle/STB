import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

class DetailInfoSection extends StatelessWidget {
  final ShoppingWithContext shopping;

  const DetailInfoSection({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem(const Icon(CupertinoIcons.money_dollar), 'Amount spent',
          '${shopping.ammountSpent},-',),
        _buildInfoItem(const Icon(CupertinoIcons.shopping_cart), 'Items bought',
          'TODO/${shopping.numberOfItems}',),
        _buildInfoItem(const Icon(CupertinoIcons.person_2_fill), 'Members',
          '${shopping.numberOfParticipants}',),
      ],
    );
  }

  Widget _buildInfoItem(Widget icon, String label, String data) {
    return Row(
      children: [
        SizedBox(width: 40.0,child: icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold),),
            Text(data),
          ]
        )
      ],
    );
  }
}
