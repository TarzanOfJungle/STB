import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/set_text_editing_controller_value.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row_item.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/common/widgets/dialogs/stb_dialog.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/add_product_assignment_controller.dart';
import 'package:split_the_bill/purchases/models/add_product_assignment_state/add_product_assignment_state.dart';
import 'package:split_the_bill/purchases/widgets/product_lookup_list_tile.dart';

const _INCREMENT_BUTTONS_WIDTH = 120.0;
const _LOOKUP_LIST_HEIGHT = 150.0;
const _LOOKUP_ANIMATION_DURATION = const Duration(milliseconds: 150);

class AddProductAssignmentDialog extends StatefulWidget {
  const AddProductAssignmentDialog({super.key});

  @override
  State<AddProductAssignmentDialog> createState() =>
      _AddProductAssignmentDialogState();
}

class _AddProductAssignmentDialogState
    extends State<AddProductAssignmentDialog> {
  final _productNameController = TextEditingController();
  final _productQuantityController = TextEditingController();

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
    return StreamBuilder(
      stream: _addProductAssignmentController.addProductAssignmentStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorBanner();
        }
        if (!snapshot.hasData) {
          return const LoadingIndicator();
        }
        final state = snapshot.data!;
        _adjustTextEditControllersToNewState(state);
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildQuantityTextField(),
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
    _productQuantityController.setValue(state.quantity?.toString());
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

  Widget _buildQuantityTextField() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: StbNumberInputField(
            controller: _productQuantityController,
            label: "Quantity",
            prefix: const Icon(
              UiConstants.quantityIcon,
              size: 15,
            ),
            onChanged: (value) {
              final quantity = int.tryParse(value);
              _addProductAssignmentController
                  .setProductAssignmentQuantity(quantity);
            },
          ),
        ),
        const SizedBox(width: STANDARD_PADDING),
        ButtonRow(
          fixedWidth: _INCREMENT_BUTTONS_WIDTH,
          buttons: [
            ButtonRowItem(
              buttonChild: const Icon(Icons.remove_rounded),
              onTap: () => _addToQuantity(-1),
            ),
            ButtonRowItem(
              buttonChild: const Icon(Icons.add_rounded),
              onTap: () => _addToQuantity(1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSuggestionsList() {
    return StreamBuilder(
      stream: _addProductAssignmentController.productLookup,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const SizedBox.shrink();
        }
        final lookupValues = snapshot.data!;
        final size = lookupValues.isEmpty ? 0.0 : _LOOKUP_LIST_HEIGHT;
        return AnimatedSize(
          curve: Curves.easeIn,
          duration: _LOOKUP_ANIMATION_DURATION,
          child: SizedBox(
            height: size,
            child: ListView.builder(
              itemCount: lookupValues.length,
              itemBuilder: (context, index) {
                final value = lookupValues[index];
                return ProductLookupListTile(
                  product: value,
                  onTap: () {
                    _addProductAssignmentController
                        .setProductAssignmentName(value.name);
                    _addProductAssignmentController.setProductSearchQuery(null);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _addToQuantity(int quantityToAdd) {
    final quantityToAddTo =
        _addProductAssignmentController.addProductAssignmentState.quantity ?? 0;
    final newQuantity = quantityToAddTo + quantityToAdd;
    _addProductAssignmentController.setProductAssignmentQuantity(newQuantity);
  }
}
