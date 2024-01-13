import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/components/search_field.dart';
import 'package:split_the_bill/common/widgets/components/stb_icon_appbar_button.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/shoppings_list/controllers/shopping_list_controller.dart';
import 'package:split_the_bill/common/widgets/dialogs/shopping_parameters_dialog.dart';
import 'package:split_the_bill/shoppings_list/widgets/shopping_tile.dart';

import '../../common/constants/ui_constants.dart';
import '../../ioc_container.dart';

const String _EMPTY_LIST_MESSAGE = "No shoppings yet";

class ShoppingsListPage extends StatefulWidget {
  ShoppingsListPage({super.key});

  final _shoppingsListController = get<ShoppingsListController>();

  @override
  State<ShoppingsListPage> createState() => _ShoppingsListPageState();
}

class _ShoppingsListPageState extends State<ShoppingsListPage> {
  bool _showfinalized = false;
  final _searchFieldController = TextEditingController();


  @override
  void initState() {
    super.initState();
    widget._shoppingsListController.updateShoppingsList();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: 'Shoppings',
      actions: [
        StbIconAppbarButton(
          onPressed: () => _onNewButtonPressed(context),
          iconData: Icons.add,
        ),
      ],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(SMALL_PADDING),
            child: Row(
              children: [
                _buildSearchField(),
                const SizedBox(
                  width: SMALL_PADDING,
                ),
                _buildFinalizedFilter(),
              ],
            ),
          ),
          _showList(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: SearchField(
        controller: _searchFieldController,
        onValueChanged: (query) => widget._shoppingsListController
            .updateShoppingsList(searchQuery: query),
        onSearchCleared: () =>
            widget._shoppingsListController.updateShoppingsList(),
      ),
    );
  }

  Widget _buildFinalizedFilter() {
    return Column(
      children: [
        Switch(
          value: _showfinalized,
          onChanged: (_) {
            _showfinalized = !_showfinalized;
            setState(() {});
          },
        ),
        Text(
          "Finalized",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize),
        ),
      ],
    );
  }

  Widget _showList() {
    return StreamBuilderWithHandling(
        stream: widget._shoppingsListController.shoppingsListStream,
        buildWhenData: (context, data) {
          final shoppingsList = data.toList();
          final filteredList = _showfinalized
              ? shoppingsList
              : shoppingsList
                  .where((shopping) => !shopping.shopping.finalized)
                  .toList();
          if (shoppingsList.isEmpty) {
            return const Text(_EMPTY_LIST_MESSAGE);
          }
          return Expanded(
            child: RefreshIndicator(
              onRefresh: _pullRefresh,
              child: ListView.separated(
                itemBuilder: (_, index) => ShoppingTile(
                  shopping: filteredList[index],
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: filteredList.length,
              ),
            ),
          );
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
