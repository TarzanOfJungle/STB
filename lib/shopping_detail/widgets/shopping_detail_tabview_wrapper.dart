import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/components/stb_icon_appbar_button.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/groupchat/screens/groupchat_tab_page.dart';
import 'package:split_the_bill/purchases/screens/purchases_tab_page.dart';
import 'package:split_the_bill/purchases/widgets/dialogs/add_product_assignment_dialog.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import '../../ioc_container.dart';
import '../../shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import '../../common/widgets/dialogs/shopping_parameters_dialog.dart';
import '../models/tab_view_item.dart';
import '../screens/detail_tab_page.dart';

final _TABVIEW_ITEMS = [
  const TabViewItem(
    tab: Tab(
      text: 'Items',
    ),
    page: PurchasesTabPage(),
  ),
  TabViewItem(
    tab: const Tab(
      text: 'Detail',
    ),
    page: DetailTabPage(),
  ),
  const TabViewItem(
    tab: Tab(
      text: 'Chat',
    ),
    page: GroupchatTabPage(),
  ),
];

class ShoppingDetailTabviewWrapper extends StatefulWidget {
  const ShoppingDetailTabviewWrapper({super.key});

  @override
  State<ShoppingDetailTabviewWrapper> createState() =>
      _ShoppingDetailTabviewWrapperState();
}

class _ShoppingDetailTabviewWrapperState
    extends State<ShoppingDetailTabviewWrapper>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _shoppingDetailController = get<ShoppingDetailController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _TABVIEW_ITEMS.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTabviewIndex = _tabController.index;

    return StreamBuilderWithHandling(
      stream: _shoppingDetailController.shopping,
      buildWhenData: (context, data) {
        final shopping = data!;
        return PageTemplate(
          label: shopping.shopping.name,
          showBackButton: true,
          actions: _getActions(currentTabviewIndex, shopping),
          bottom: TabBar(
            controller: _tabController,
            tabs: _TABVIEW_ITEMS.map((item) => item.tab).toList(),
          ),
          child: TabBarView(
            controller: _tabController,
            children: _TABVIEW_ITEMS.map((item) => item.page).toList(),
          ),
        );
      },
    );
  }

  List<Widget> _getActions(
    int currentTabviewIndex,
    ShoppingWithContext shopping,
  ) {
    final addingShoppingItemsEnabled =
        !_shoppingDetailController.shoppingIsFinalized;
    final userAuthorizedForEditingShopping =
        _shoppingDetailController.userIsCreator &&
            !_shoppingDetailController.shoppingIsFinalized;

    if (currentTabviewIndex == 0 && addingShoppingItemsEnabled) {
      return [
        StbIconAppbarButton(
          onPressed: () => _showAddProductAssignmentDialog(),
          iconData: Icons.add_shopping_cart_rounded,
        ),
      ];
    } else if (currentTabviewIndex == 1 && userAuthorizedForEditingShopping) {
      return [
        StbIconAppbarButton(
          onPressed: () => _onEditButtonPressed(shopping),
          iconData: Icons.edit,
        ),
      ];
    }
    return [];
  }

  void _onEditButtonPressed(ShoppingWithContext shopping) {
    showDialog(
      context: context,
      builder: (context) => ShoppingParametersDialog(
        shopping: shopping,
      ),
    );
  }

  void _showAddProductAssignmentDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddProductAssignmentDialog(),
    );
  }
}
