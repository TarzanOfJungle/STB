import 'package:flutter/material.dart';
import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/models/post_shopping/post_shopping.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../../ioc_container.dart';

class ShoppingParametersDialog extends StatefulWidget {
  final ShoppingWithContext? shopping;

  const ShoppingParametersDialog({super.key, this.shopping});

  @override
  State<ShoppingParametersDialog> createState() =>
      _ShoppingParametersDialogState();
}

class _ShoppingParametersDialogState extends State<ShoppingParametersDialog> {
  final _shoppingsListController = get<ShoppingsListController>();
  final _navRouter = get<NavRouter>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text =
        widget.shopping == null ? '' : widget.shopping!.shopping.name;
    _descriptionController.text = widget.shopping == null
        ? ''
        : widget.shopping!.shopping.description ?? '';
    return SimpleDialog(
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(STANDARD_BORDER_RADIUS))),
        title: Text(
          widget.shopping == null
              ? "Add New Shopping"
              : "Edit Shopping Parameters",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(STANDARD_PADDING),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StbTextField(
                    controller: _nameController,
                    label: "Name",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  StbTextField(
                    controller: _descriptionController,
                    label: "Description (optional)",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  StbElevatedButton(
                    text: widget.shopping == null ? 'Add' : 'Submit',
                    stretch: true,
                    onTap: () {
                      _confirm();
                      _navRouter.returnBack();
                    }
                  )
                ],
              ),
            ),
          )
        ]);
  }

  Future<void> _confirm() async {
    if (_nameController.text.isNotEmpty && _nameController.text.trim() != "") {
      var wasSuccess = false;
      var description = _descriptionController.text.isNotEmpty
          ? _descriptionController.text
          : null;
      var post =
          PostShopping(name: _nameController.text, description: description);
      wasSuccess = widget.shopping == null
          ? await _shoppingsListController.addShopping(postShopping: post)
          : await _shoppingsListController.updateShopping(
              postShopping: post, shoppingId: widget.shopping!.shopping.id);
      if (wasSuccess) {
        var shopping = await _shoppingsListController.lastUpdatedShopping.first;
        _navRouter.toShoppingDetail(shopping!.shopping.id);
      } else {
        throw const ApiUnspecifiedException();
      }
    }
  }
}
