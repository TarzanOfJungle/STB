import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/dialogs/confirmation_dialog.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/widgets/user_list_tile.dart';

const _NO_FRIENDS_MESSAGE =
    "You don't have any friends yet. Add some by clicking the button below.";

class FriendsListPage extends StatelessWidget {
  final _friendsController = get<FriendsController>();

  FriendsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
        return SlidableAutoCloseBehavior(
          child: ListView.separated(
            itemCount: friends.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: UiConstants.deleteColor,
                    icon: Icons.delete_rounded,
                    label: "Remove",
                    onPressed: (_) =>
                        _showRemoveFriendDialog(context, friends[index]),
                  )
                ],
              ),
              child: UserListTile(
                user: friends[index],
                onTap: () => print("user clicked"),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showRemoveFriendDialog(BuildContext context, User friendToRemove) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        label: "Remove friend",
        confirmText: "Yes",
        description:
            "Are you sure you want to remove ${friendToRemove.username} from your friends list?",
        onConfirm: () => _friendsController.removeFriend(friendToRemove.id),
      ),
    );
  }
}
