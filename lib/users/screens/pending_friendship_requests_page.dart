import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/widgets/user_list_tile.dart';

const _NO_PENDING_FRIENDSHIP_REQUESTS_MESSAGE =
    "You don't have any pending friendship requests at the moment.";

class PendingFriendshipRequestsPage extends StatelessWidget {
  final _friendsController = get<FriendsController>();

  PendingFriendshipRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _friendsController.pendingFriendshipRequestsToAccept,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: ErrorBanner());
        }
        if (!snapshot.hasData) {
          return const Center(child: LoadingIndicator());
        }
        final pendingFriendshipRequests = snapshot.data!;
        if (pendingFriendshipRequests.isEmpty) {
          return const NoDataBanner(
              text: _NO_PENDING_FRIENDSHIP_REQUESTS_MESSAGE);
        }
        return ListView.separated(
          itemCount: pendingFriendshipRequests.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => UserListTile(
            user: pendingFriendshipRequests[index].applicant,
            relatedFriendshipRequest: pendingFriendshipRequests[index],
            onTap: null,
          ),
        );
      },
    );
  }
}
