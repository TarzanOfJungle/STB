import 'package:flutter/material.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/widgets/user_list_tile.dart';

const _NO_FRIENDS_MESSAGE =
    "You don't have any friends yet. Add some by clicking the button below.";

class FriendsPage extends StatelessWidget {
  final _navRouter = get<NavRouter>();
  final _friendsController = get<FriendsController>();

  FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: 'Friends',
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add_rounded),
        onPressed: () => _navRouter.toUsersSearch(),
      ),
      child: StreamBuilder(
        stream: _friendsController.friendsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: ErrorBanner());
          }
          if (!snapshot.hasData) {
            return const Center(child: LoadingIndicator());
          }
          final friends = snapshot.data!;
          if (friends.isEmpty) {
            return const NoDataBanner(text: _NO_FRIENDS_MESSAGE);
          }
          return ListView.separated(
            itemCount: friends.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => UserListTile(
              user: friends[index],
              onTap: () => print("user clicked"),
            ),
          );
        },
      ),
    );
  }
}
