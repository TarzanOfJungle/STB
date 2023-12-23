import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/app_bar_button.dart';
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
  @override
  void initState() {
    super.initState();
    _tabViewItems = [
      TabViewItem(
          textTab: const Tab(
            text: 'Items',
          ),
          tab: Tab(
            child: PurchasesTabPage(),
          )),
      TabViewItem(
        textTab: const Tab(
          text: 'Detail',
        ),
        tab: Tab(
          child: DetailTabPage(),
        ),
      ),
      const TabViewItem(
        textTab: Tab(
          text: 'Chat',
        ),
        tab: Tab(
          child: GroupchatTabPage(),
        ),
      ),
    ];
    _tabController = TabController(length: _tabViewItems.length, vsync: this);
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
        return Scaffold(
          appBar: AppBar(
            title: Text(
              shopping.shopping.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              AppBarButton(
                label: 'Edit',
                onPressed: () => _onEditButtonPressed(context, shopping),
              ),
              const SizedBox(
                width: STANDARD_PADDING,
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabViewItems.map((item) => item.textTab).toList(),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: _tabViewItems.map((item) => item.tab.child!).toList(),
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
}
