import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../common/widgets/confirmation_dialog.dart';
import '../../ioc_container.dart';

const double _BUTTON_WIDTH = 150.0;

class DetailButtonSection extends StatelessWidget {
  final ShoppingWithContext shopping;

  DetailButtonSection({super.key, required this.shopping});

  final _shoppingsListController = get<ShoppingsListController>();
  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(
          const Icon(Icons.person_add),
          'Invite users',
          () {}, //TODO
        ),
        _buildButton(
          const Icon(Icons.done),
          'Finalize',
          () {}, //TODO
        ),
        _buildButton(
          const Icon(CupertinoIcons.trash),
          'Delete',
          () => _onDeleteButtonPressed(context, shopping),
        ),
      ],
    );
  }

  Widget _buildButton(Icon icon, String text, void Function() onPressedCall) {
    return SizedBox(
      width: _BUTTON_WIDTH,
      child: ElevatedButton.icon(
        onPressed: onPressedCall,
        icon: icon,
        label: Text(text),
      ),
    );
  }

  void _onDeleteButtonPressed(context, ShoppingWithContext shopping) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        label: 'Delete Shopping: ${shopping.shopping.name}?',
        description: 'Are you sure about this? You cannot take back this step.',
        onConfirm: () async {
          var wasSuccess = await _shoppingsListController.deleteShopping(
              shoppingId: shopping.shopping.id);
          if (wasSuccess) {
            _navRouter.toShoppingList();
          }
        },
      ),
    );
  }
}
