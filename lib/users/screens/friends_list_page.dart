import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/dialogs/confirmation_dialog.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/widgets/user_list_tile.dart';

const _NO_FRIENDS_MESSAGE =
    "You don't have any friends yet. Add some by clicking the button below.";

class FriendsListPage extends StatelessWidget {
  final _navRouter = get<NavRouter>();
  final _friendsController = get<FriendsController>();

  FriendsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilderWithHandling(
      stream: _friendsController.friendsStream,
      buildWhenData: (context, friends) {
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
                onTap: () => _navRouter.toUserChatPage(friends[index]),
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
