import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/models/friendship_request/friendship_request.dart';
import 'package:split_the_bill/users/models/user/user.dart';
import 'package:split_the_bill/users/widgets/non_friend_user_detail_dialog.dart';
import 'package:split_the_bill/users/widgets/user_list_tile.dart';

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
      child: StreamBuilder(
        stream: Rx.combineLatest2(
          _friendsController.nonFriendsSearchStream,
          _friendsController.allPendingFriendshipRequests,
          (users, friendshipRequests) =>
              (nonFriends: users, friendshipRequests: friendshipRequests),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: ErrorBanner());
          }

          final nonFriendUsers = snapshot.data?.nonFriends ?? [];
          final friendshipRequests = snapshot.data?.friendshipRequests ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUserSearch(),
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

  Widget _buildUserSearch() {
    return Padding(
      padding: const EdgeInsets.all(STANDARD_PADDING),
      child: StbTextField(
        controller: _userTextSearchController,
        label: "Search",
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => _friendsController
            .searchNonFriendUsers(value.isEmpty ? null : value),
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
      padding: EdgeInsets.all(STANDARD_PADDING),
      child: Center(
        child: Text("Type in username or email of desired user to search!"),
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
