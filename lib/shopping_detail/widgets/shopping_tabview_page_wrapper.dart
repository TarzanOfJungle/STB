import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

import '../../shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import '../models/tab_view_item.dart';
import '../screens/detail_page.dart';

class ShoppingTabviewPageWrapper extends StatefulWidget {
  final ShoppingWithContext shopping;

  const ShoppingTabviewPageWrapper({super.key, required this.shopping});

  @override
  State<ShoppingTabviewPageWrapper> createState() =>
      _ShoppingTabviewPageWrapperState();
}

class _ShoppingTabviewPageWrapperState extends State<ShoppingTabviewPageWrapper>
    with SingleTickerProviderStateMixin {
  late final List<TabViewItem> _tabViewItems;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabViewItems = [
      const TabViewItem(
          textTab: Tab(
            text: 'Items',
          ),
          tab: Tab(
            child: Center(child: Text('Items page TBD')), //TODO
          )),
      TabViewItem(
        textTab: const Tab(
          text: 'Detail',
        ),
        tab: Tab(
          child: DetailPage(
            shopping: widget.shopping,
          ),
        ),
      ),
      const TabViewItem(
        textTab: Tab(
          text: 'Chat',
        ),
        tab: Tab(
          child: Center(child: Text('Chat page TBD')), //TODO
        ),
      ),
    ];
    _tabController = TabController(length: _tabViewItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.shopping.shopping.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {}, //TODO
            child: const Text('Edit'),
          ),
          const SizedBox(width: STANDARD_PADDING,),
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
  }
}
