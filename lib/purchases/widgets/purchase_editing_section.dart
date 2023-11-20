import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';

const _INPUT_FIELDS_WIDTH = 150.0;

class PurchaseEditingSection extends StatefulWidget {
  final PurchaseState state;
  final IconData ammountIcon;
  final IconData quantityIcon;

  const PurchaseEditingSection({
    super.key,
    required this.state,
    required this.ammountIcon,
    required this.quantityIcon,
  });

  @override
  State<PurchaseEditingSection> createState() => _PurchaseEditingSectionState();
}

class _PurchaseEditingSectionState extends State<PurchaseEditingSection> {
  final _purchaseQuantityController = TextEditingController();
  final _purchaseUnitPriceController = TextEditingController();

  final _purchaseController = get<SinglePurchaseController>();
  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    _adjustTextEditingControllersToNewState(widget.state);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(height: 30),
        _buildTitle(context),
        const SizedBox(
          height: STANDARD_PADDING,
        ),
        _buildMyPurchase(context),
        const SizedBox(
          height: 20,
        ),
        _buildSaveButton(context),
        const Divider(height: 30),
      ],
    );
  }

  void _adjustTextEditingControllersToNewState(PurchaseState newState) {
    _adjustTextEditingControllerToNewValue(
      _purchaseQuantityController,
      newState.currentUserPurchaseQuantity?.toString(),
    );
    // Unit price TF doesn't need to be adjusted continuously, just on initial load
    if (newState.currentUserPurchaseUnitPrice != null &&
        _purchaseUnitPriceController.text.isEmpty) {
      final unitPriceHasDecimal =
          newState.currentUserPurchaseUnitPrice!.roundToDouble() !=
              newState.currentUserPurchaseUnitPrice!;
      final unitPriceStringValue = unitPriceHasDecimal
          ? newState.currentUserPurchaseUnitPrice!.toString()
          : newState.currentUserPurchaseUnitPrice!.toStringAsFixed(0);
      _adjustTextEditingControllerToNewValue(
        _purchaseUnitPriceController,
        unitPriceStringValue,
      );
    }
  }

  void _adjustTextEditingControllerToNewValue(
    TextEditingController controller,
    String? newValue,
  ) {
    controller.text = newValue ?? "";
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  Widget _buildTitle(BuildContext context) {
    final text = _purchaseController.isUsersFirstPurchase
        ? "Add your purchase"
        : "Update your purchase";
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (!_purchaseController.isUsersFirstPurchase)
          IconButtonWithBackground(
            onTap: () async {
              final success =
                  await _purchaseController.deleteExistingPurchase();
              if (success) {
                _navRouter.returnBack();
              }
            },
            icon: Icons.close_rounded,
            backgroundColor: UiConstants.deleteColor,
            iconColor: Colors.white,
          )
      ],
    );
  }

  Widget _buildMyPurchase(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StbNumberInputField(
          controller: _purchaseQuantityController,
          fixedWidth: _INPUT_FIELDS_WIDTH,
          label: "Quantity",
          prefix: Icon(
            widget.quantityIcon,
            size: 15,
          ),
          allowDecimals: false,
          onChanged: (value) {
            final newQuantity =
                _purchaseController.getAdditionalValueFromString(
                    value, (toParse) => int.tryParse(toParse));
            _purchaseController.additionalQuantityChanged(newQuantity);
          },
        ),
        StbNumberInputField(
          controller: _purchaseUnitPriceController,
          fixedWidth: _INPUT_FIELDS_WIDTH,
          label: "Unit price",
          prefix: Icon(
            widget.ammountIcon,
            size: 15,
          ),
          suffix: const Text(",-"),
          onChanged: (value) {
            final newUnitPrice =
                _purchaseController.getAdditionalValueFromString(
                    value, (toParse) => double.tryParse(toParse));
            _purchaseController.additionalUnitPriceChanged(newUnitPrice);
          },
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    final enabled = _purchaseController.dataValidForSaving();
    final buttonText = _purchaseController.isUsersFirstPurchase
        ? "Add my purchase"
        : "Update my purchase";

    return StreamBuilder(
      stream: _purchaseController.isLoadingStream,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? true;
        if (isLoading) {
          return const LoadingIndicator();
        }
        return StbElevatedButton(
          leadingIcon: Icons.shopping_cart_rounded,
          text: buttonText,
          stretch: true,
          enabled: enabled,
          onTap: () async {
            final success = await _purchaseController.saveChanges();
            if (success) {
              _navRouter.returnBack();
            }
          },
        );
      },
    );
  }
}
