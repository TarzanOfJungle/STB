import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/components/app_bar_button.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import 'package:split_the_bill/common/widgets/dialogs/shopping_parameters_dialog.dart';
import 'package:split_the_bill/shoppings_list/widgets/shopping_tile.dart';

import '../../common/constants/ui_constants.dart';
import '../../ioc_container.dart';

const String _EMPTY_LIST_MESSAGE = "No shoppings yet";
const String _LOADING_LIST_ERROR_MESSAGE = "Unable to load list of shoppings";

class ShoppingsListPage extends StatelessWidget {
  ShoppingsListPage({super.key});

  final _shoppingsListController = get<ShoppingsListController>();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: 'Shoppings',
      actions: [
        AppBarButton(
          label: 'New',
          onPressed: () => _onNewButtonPressed(context), //TODO
        ),
        const SizedBox(
          width: STANDARD_PADDING,
        ),
      ],
      child: FutureBuilder<bool>(
        future: _shoppingsListController.updateShoppingsList(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Center(child: LoadingIndicator());
          } else {
            if (!snapshot.data!) {
              return const Text(_LOADING_LIST_ERROR_MESSAGE);
            }
            return _showList();
          }
        },
      ),
    );
  }

  Widget _showList() {
    return StreamBuilder<Iterable<ShoppingWithContext>>(
        stream: _shoppingsListController.shoppingsListStream,
        builder: (BuildContext context,
            AsyncSnapshot<Iterable<ShoppingWithContext>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Center(
              child: LoadingIndicator(),
            );
          } else {
            final shoppingsList = snapshot.data!.toList();
            if (shoppingsList.isEmpty) {
              return const Text(_EMPTY_LIST_MESSAGE);
            }
            return ListView.separated(
              itemBuilder: (_, index) =>
                  ShoppingTile(
                    shopping: shoppingsList[index],
                  ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: shoppingsList.length,
            );
          }
        });
  }

  void _onNewButtonPressed(context) {
    showDialog(
      context: context,
      builder: (context) => const ShoppingParametersDialog(),
    );
  }
}
