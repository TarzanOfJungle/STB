import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

const double _BUTTON_WIDTH = 150.0;
class DetailButtonSection extends StatelessWidget {
  final ShoppingWithContext shopping;
  const DetailButtonSection({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          _buildButton(const Icon(Icons.person_add), 'Invite users'),
          _buildButton(const Icon(Icons.done), 'Finalize'),
          _buildButton(const Icon(CupertinoIcons.trash), 'Delete')
        ],
      );
  }

  Widget _buildButton(Icon icon, String text) {
    return SizedBox(
      width: _BUTTON_WIDTH,
      child: ElevatedButton.icon(
        onPressed: () {}, //TODO
        icon: icon,
        label: Text(text),
      ),
    );
  }
}
