import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/set_text_editing_controller_value.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row_item.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/products/models/product/product.dart';
import 'package:split_the_bill/purchases/controllers/product_lookup_controller.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/add_product_assignment_state/add_product_assignment_state.dart';
import 'package:split_the_bill/purchases/widgets/product_chip.dart';

const _INCREMENT_BUTTONS_WIDTH = 120.0;

class AddProductAssignmentDialog extends StatefulWidget {
  AddProductAssignmentDialog({super.key});

  @override
  State<AddProductAssignmentDialog> createState() =>
      _AddProductAssignmentDialogState();
}

class _AddProductAssignmentDialogState
    extends State<AddProductAssignmentDialog> {
  final _productNameController = TextEditingController();
  final _productQuantityController = TextEditingController();

  final _productLookupController = get<ProductLookupController>();
  final _purchasesController = get<PurchasesController>();
  final _navRouter = get<NavRouter>();

  @override
  void initState() {
    _productLookupController.setProductNameSearchQuery(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 26,
        ),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: _purchasesController.addProductAssignmentStateStream,
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
            _buildTitle(context),
            const SizedBox(height: 25),
            _buildProductNameTextField(),
            const SizedBox(
              height: 25,
            ),
            _buildQuantityTextField(),
            const SizedBox(height: 10),
            StbElevatedButton(
              text: "Add item",
              enabled: state.canCreateAssignment,
              leadingIcon: Icons.add_rounded,
              onTap: () async {
                final success =
                    await _purchasesController.createNewProductAssignment();
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

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.add_shopping_cart_rounded,
          size: 35,
        ),
        const SizedBox(width: 10),
        Text(
          "Add shopping item",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Widget _buildProductNameTextField() {
    return StbTextField(
      controller: _productNameController,
      label: "Product name",
      enableSuggestions: true,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        _purchasesController.setAddProductAssignmentName(value);
        _productLookupController.setProductNameSearchQuery(value);
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
              _purchasesController.setAddProductAssignmentQuantity(quantity);
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

  Widget _buildSuggestionsList({
    required AddProductAssignmentState state,
  }) {
    return ListView(
      children: [
        ...[
          const Product(id: 1, name: "test", description: null, creatorId: 1),
          const Product(
              id: 2,
              name: "Vodka absolut 22.3L",
              description: "asfd",
              creatorId: 1),
        ]
            .map(
              // TODO
              (product) => ProductChip(
                product: product,
                onTap: () {},
                isSelected: false,
              ),
            )
            .toList(),
      ],
    );
  }

  void _addToQuantity(int quantityToAdd) {
    final newQuantity =
        (_purchasesController.addProductAssignmentState.quantity ?? 0) +
            quantityToAdd;
    _purchasesController.setAddProductAssignmentQuantity(newQuantity);
  }
}
