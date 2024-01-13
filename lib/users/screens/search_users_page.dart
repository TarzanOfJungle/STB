import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/search_field.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/models/friendship_request/friendship_request.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/widgets/non_friend_user_detail_dialog.dart';
import 'package:split_the_bill/users/widgets/user_list_tile.dart';

const _SEARCH_USERS_ICON_SIZE = 70.0;
const _SEARCH_USERS_MESSAGE =
    "Type in username or email of desired user to search!";

class SearchUsersPage extends StatefulWidget {
  const SearchUsersPage({super.key});

  @override
  State<SearchUsersPage> createState() => _SearchUsersPageState();
}

class _SearchUsersPageState extends State<SearchUsersPage> {
  final _userTextSearchController = TextEditingController();
  final _friendsController = get<FriendsController>();

  @override
  void initState() {
    _resetSearch();
    super.initState();
  }

  @override
  void dispose() {
    _resetSearch();
    _userTextSearchController.dispose();
    super.dispose();
  }

  void _resetSearch() {
    _friendsController.searchNonFriendUsers(null);
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      showBackButton: true,
      label: "Search users",
      child: StreamBuilderWithHandling(
        stream: Rx.combineLatest2(
          _friendsController.nonFriendsSearchStream,
          _friendsController.allPendingFriendshipRequests,
          (users, friendshipRequests) =>
              (nonFriends: users, friendshipRequests: friendshipRequests),
        ),
        buildWhenData: (context, data) {
          final nonFriendUsers = data.nonFriends;
          final friendshipRequests = data.friendshipRequests;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(STANDARD_PADDING),
                child: SearchField(
                  controller: _userTextSearchController,
                  onValueChanged: (value) => _friendsController
                      .searchNonFriendUsers(value.isEmpty ? null : value),
                  onSearchCleared: () =>
                      _friendsController.searchNonFriendUsers(null),
                ),
              ),
              Expanded(
                child: _buildUserList(
                  nonFriendUsers,
                  friendshipRequests,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUserList(
    List<User> nonFriendUsers,
    List<FriendshipRequest> friendshipRequests,
  ) {
    if (nonFriendUsers.isEmpty) {
      return _buildNoUsersBanner();
    }
    return ListView.separated(
        itemCount: nonFriendUsers.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final user = nonFriendUsers[index];
          final relatedFriendshipRequest = friendshipRequests
              .where((request) =>
                  request.applicant.id == user.id ||
                  request.acceptant.id == user.id)
              .firstOrNull;

          return UserListTile(
            user: user,
            relatedFriendshipRequest: relatedFriendshipRequest,
            onTap: () => _openUserDetailDialog(user, relatedFriendshipRequest),
          );
        });
  }

  Widget _buildNoUsersBanner() {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Icon(
              Icons.search_rounded,
              size: _SEARCH_USERS_ICON_SIZE,
            ),
            SizedBox(height: STANDARD_PADDING),
            Text(
              _SEARCH_USERS_MESSAGE,
              textAlign: TextAlign.center,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void _openUserDetailDialog(
    User user,
    FriendshipRequest? relatedFriendshipRequest,
  ) {
    showDialog(
      context: context,
      builder: (context) => NonFriendUserDetailDialog(
        user: user,
        relatedFriendshipRequest: relatedFriendshipRequest,
      ),
    );
  }
}
