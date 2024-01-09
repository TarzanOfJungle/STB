import 'package:flutter/material.dart';
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

class ShoppingsListPage extends StatefulWidget {
  ShoppingsListPage({super.key});

  final _shoppingsListController = get<ShoppingsListController>();

  @override
  State<ShoppingsListPage> createState() => _ShoppingsListPageState();
}

class _ShoppingsListPageState extends State<ShoppingsListPage> {
  final _searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: 'Shoppings',
      actions: [
        IconButton.outlined(
          iconSize: 30.0,
          icon: const Icon(Icons.add),
          onPressed: () => _onNewButtonPressed(context),
        ),
        const SizedBox(
          width: STANDARD_PADDING,
        ),
      ],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(SMALL_PADDING),
            child: TextField(
              controller: _searchFieldController,
              onChanged: (query) => widget._shoppingsListController
                  .updateShoppingsList(searchQuery: query), //TODO search bar
              decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _searchFieldController.clear();
                        widget._shoppingsListController.updateShoppingsList();
                      },
                      icon: const Icon(Icons.clear))),
            ),
          ),
          FutureBuilder<bool>(
            future: widget._shoppingsListController
                .updateShoppingsList(searchQuery: _searchFieldController.text),
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
        ],
      ),
    );
  }

  Widget _showList() {
    return StreamBuilder<Iterable<ShoppingWithContext>>(
        stream: widget._shoppingsListController.shoppingsListStream,
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
            return Expanded(
              child: RefreshIndicator(
                onRefresh: _pullRefresh,
                child: ListView.separated(
                  itemBuilder: (_, index) => ShoppingTile(
                    shopping: shoppingsList[index],
                  ),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: shoppingsList.length,
                ),
              ),
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

  Future<void> _pullRefresh() async {
    await widget._shoppingsListController
        .updateShoppingsList(searchQuery: _searchFieldController.text);
  }
}
