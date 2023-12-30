import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../common/widgets/dialogs/confirmation_dialog.dart';
import '../../ioc_container.dart';

const double _BUTTON_WIDTH = 150.0;

class DetailButtonSection extends StatelessWidget {
  final ShoppingWithContext shopping;

  DetailButtonSection({super.key, required this.shopping});

  final _shoppingsListController = get<ShoppingsListController>();
  final _navRouter = get<NavRouter>();
  final _authController = get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(
          const Icon(Icons.person),
          'Members',
          () => _navRouter.toShoppingMembers(),
        ),
        ..._finalizeAndDeleteButtons(context),
      ],
    );
  }

  List<Widget> _finalizeAndDeleteButtons(BuildContext context) {
    var loggedInUser = _authController.loggedInUser;
    if (loggedInUser?.id == shopping.shopping.creatorId) {
      return [
        _buildButton(
          const Icon(Icons.done),
          'Finalize',
              () {}, //TODO
          color: UiConstants.confirmColor,
        ),
        _buildButton(
          const Icon(CupertinoIcons.trash),
          'Delete',
              () => _onDeleteButtonPressed(context, shopping),
          color: UiConstants.deleteColor,
        ),
      ];
    }
    return [];
  }

  Widget _buildButton(Icon icon, String text, void Function() onPressedCall,
      {Color? color}) {
    return SizedBox(
      width: _BUTTON_WIDTH,
      child: ElevatedButton.icon(
        onPressed: onPressedCall,
        icon: icon,
        label: Text(text),
        style: ElevatedButton.styleFrom(backgroundColor: color),
      ),
    );
  }

  void _onDeleteButtonPressed(context, ShoppingWithContext shopping) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
          label: 'Delete Shopping:\n${shopping.shopping.name}?',
          description:
              'Are you sure about this?\nYou cannot take it back',
          onConfirm: _delete),
    );
  }

  Future<void> _delete() async {
    var wasSuccess = await _shoppingsListController.deleteShopping(
        shoppingId: shopping.shopping.id);
    if (wasSuccess) {
      _navRouter.toShoppingList();
    } else {
      throw const ApiUnspecifiedException();
    }
  }
}
