import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/groupchat/screens/groupchat_tab_page.dart';
import 'package:split_the_bill/purchases/screens/purchases_tab_page.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import '../../ioc_container.dart';
import '../../shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import '../../common/widgets/dialogs/shopping_parameters_dialog.dart';
import '../models/tab_view_item.dart';
import '../screens/detail_tab_page.dart';

class ShoppingDetailTabviewWrapper extends StatefulWidget {
  const ShoppingDetailTabviewWrapper({super.key});

  @override
  State<ShoppingDetailTabviewWrapper> createState() =>
      _ShoppingDetailTabviewWrapperState();
}

class _ShoppingDetailTabviewWrapperState
    extends State<ShoppingDetailTabviewWrapper>
    with SingleTickerProviderStateMixin {
  late final List<TabViewItem> _tabViewItems;
  late final TabController _tabController;
  final _shoppingDetailController = get<ShoppingDetailController>();
  final _authController = get<AuthController>();
  @override
  void initState() {
    super.initState();
    _tabViewItems = [
      TabViewItem(
        tab: const Tab(
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
    _tabController = TabController(length: _tabViewItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _shoppingDetailController.shopping,
      builder:
          (BuildContext context, AsyncSnapshot<ShoppingWithContext?> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          //TODO page loading
          return const LoadingIndicator();
        }
        var shopping = snapshot.data!;
        var loggedInUser = _authController.loggedInUser;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              shopping.shopping.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: shopping.shopping.creatorId == loggedInUser!.id ? _actions(shopping) : [],
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabViewItems.map((item) => item.tab).toList(),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: _tabViewItems.map((item) => item.page).toList(),
          ),
        );
      },
    );
  }

  void _onEditButtonPressed(context, ShoppingWithContext shopping) {
    showDialog(
      context: context,
      builder: (context) => ShoppingParametersDialog(
        shopping: shopping,
      ),
    );
  }

  List<Widget> _actions(ShoppingWithContext shopping) {
    return [
      IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () => _onEditButtonPressed(context, shopping),
      ),
      const SizedBox(
        width: STANDARD_PADDING,
      ),
    ];
  }
}
