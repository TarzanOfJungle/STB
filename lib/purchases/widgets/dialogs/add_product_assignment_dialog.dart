import 'package:flutter/material.dart';
import 'package:split_the_bill/common/extensions/set_text_editing_controller_value.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/animated_lookup_list.dart';
import 'package:split_the_bill/common/widgets/components/quantity_editing_section.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/common/widgets/dialogs/stb_dialog.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/add_product_assignment_controller.dart';
import 'package:split_the_bill/purchases/models/add_product_assignment_state/add_product_assignment_state.dart';

const _LOOKUP_LIST_HEIGHT = 150.0;

class AddProductAssignmentDialog extends StatefulWidget {
  const AddProductAssignmentDialog({super.key});

  @override
  State<AddProductAssignmentDialog> createState() =>
      _AddProductAssignmentDialogState();
}

class _AddProductAssignmentDialogState
    extends State<AddProductAssignmentDialog> {
  final _productNameController = TextEditingController();

  final _addProductAssignmentController = get<AddProductAssignmentController>();
  final _navRouter = get<NavRouter>();

  @override
  void initState() {
    _addProductAssignmentController.resetState();
    super.initState();
  }

  @override
  void dispose() {
    _addProductAssignmentController.resetState();
    _productNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StbDialog(
      title: "Add shopping item",
      titleIcon: Icons.add_shopping_cart_rounded,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilderWithHandling(
      stream: _addProductAssignmentController.addProductAssignmentStateStream,
      buildWhenData: (context, data) {
        final state = data;
        _adjustTextEditControllersToNewState(state);
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildQuantityEditingSection(state),
            const SizedBox(height: 15),
            _buildProductNameTextField(),
            const SizedBox(height: 5),
            _buildSuggestionsList(),
            const SizedBox(height: 10),
            StbElevatedButton(
              text: "Add item",
              enabled: state.canCreateAssignment,
              leadingIcon: Icons.add_rounded,
              onTap: () async {
                final success = await _addProductAssignmentController
                    .createNewProductAssignment();
                if (success) {
                  _navRouter.returnBack();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _adjustTextEditControllersToNewState(AddProductAssignmentState state) {
    _productNameController.setValue(state.productName?.toString());
  }

  Widget _buildProductNameTextField() {
    return StbTextField(
      controller: _productNameController,
      label: "Product name",
      enableSuggestions: true,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        _addProductAssignmentController.setProductAssignmentName(value);
        _addProductAssignmentController.setProductSearchQuery(value);
      },
    );
  }

  Widget _buildQuantityEditingSection(AddProductAssignmentState state) {
    final currentQuantity = state.quantity;
    final decrementEnabled = state.quantity != null && state.quantity! > 0;
    return QuantityEditingSection(
      label: "Quantity",
      currentValue: currentQuantity,
      decrementEnabled: decrementEnabled,
      onQuantityChanged: (newQuantity) => _addProductAssignmentController
          .setProductAssignmentQuantity(newQuantity),
    );
  }

  Widget _buildSuggestionsList() {
    return StreamBuilderWithHandling(
      stream: _addProductAssignmentController.productLookup,
      buildWhenData: (context, lookupValues) {
        return AnimatedLookupList(
          isShown: lookupValues.isNotEmpty,
          items: lookupValues,
          itemIcon: Icons.add_shopping_cart_rounded,
          getItemTitle: (value) => value.name,
          heightWhenShown: _LOOKUP_LIST_HEIGHT,
          onItemSelected: (value) {
            _addProductAssignmentController
                .setProductAssignmentName(value.name);
            _addProductAssignmentController.setProductSearchQuery(null);
          },
        );
      },
    );
  }
}
