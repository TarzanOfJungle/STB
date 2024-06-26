import 'package:flutter/material.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/stb_icon_appbar_button.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shopping_detail/models/tab_view_item.dart';
import 'package:split_the_bill/users/screens/friends_list_page.dart';
import 'package:split_the_bill/users/screens/pending_friendship_requests_page.dart';

final _TABVIEW_ITEMS = [
  TabViewItem(
    tab: const Tab(
      text: "Friends",
    ),
    page: FriendsListPage(),
  ),
  TabViewItem(
    tab: const Tab(
      text: "Requests",
    ),
    page: PendingFriendshipRequestsPage(),
  )
];

class FriendsPageTabviewWrapper extends StatefulWidget {
  const FriendsPageTabviewWrapper({super.key});

  @override
  State<FriendsPageTabviewWrapper> createState() =>
      _FriendsPageTabviewWrapperState();
}

class _FriendsPageTabviewWrapperState extends State<FriendsPageTabviewWrapper>
    with SingleTickerProviderStateMixin {
  final _navRouter = get<NavRouter>();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _TABVIEW_ITEMS.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: "Friends",
      actions: [
        StbIconAppbarButton(
          onPressed: () => _navRouter.toUsersSearch(),
          iconData: Icons.person_add_rounded,
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        tabs: _TABVIEW_ITEMS.map((item) => item.tab).toList(),
      ),
      child: TabBarView(
        controller: _tabController,
        children: _TABVIEW_ITEMS.map((item) => item.page).toList(),
      ),
    );
  }
}
