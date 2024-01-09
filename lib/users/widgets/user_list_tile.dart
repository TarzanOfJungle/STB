import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/common/widgets/components/user_text_avatar.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/models/friendship_request/friendship_request.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final FriendshipRequest? relatedFriendshipRequest;
  final VoidCallback? onTap;

  final _authController = get<AuthController>();
  final _friendsController = get<FriendsController>();

  int? get _loggedInUserId => _authController.loggedInUser?.id;

  bool get _showRequestSent {
    return relatedFriendshipRequest != null &&
        relatedFriendshipRequest!.applicant.id == _loggedInUserId &&
        relatedFriendshipRequest!.acceptant.id != _loggedInUserId;
  }

  bool get _showActionButtons {
    return relatedFriendshipRequest != null &&
        relatedFriendshipRequest!.applicant.id != _loggedInUserId &&
        relatedFriendshipRequest!.acceptant.id == _loggedInUserId;
  }

  UserListTile({
    super.key,
    required this.user,
    this.relatedFriendshipRequest,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserTextAvatar(
              user: user,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(width: 15),
            Expanded(child: _buildUserIdentification(context)),
            const Spacer(),
            _buildTrailing(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdentification(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.username,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          user.email,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _buildTrailing(BuildContext context) {
    if (_showRequestSent) {
      return _buildRequestSentIcon(context);
    }
    if (_showActionButtons) {
      return _buildUpdateRequestButtons();
    }
    return const SizedBox.shrink();
  }

  Widget _buildRequestSentIcon(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.arrow_circle_right_rounded),
        Text("Requested", style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }

  Widget _buildUpdateRequestButtons() {
    if (relatedFriendshipRequest == null) {
      return const SizedBox.shrink();
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButtonWithBackground(
          onTap: () => _friendsController.updateFriendshipRequestStatus(
            applicantId: relatedFriendshipRequest!.applicant.id,
            accept: false,
          ),
          backgroundColor: UiConstants.infoColor,
          icon: Icons.close_rounded,
        ),
        IconButtonWithBackground(
          onTap: () => _friendsController.updateFriendshipRequestStatus(
            applicantId: relatedFriendshipRequest!.applicant.id,
            accept: true,
          ),
          backgroundColor: UiConstants.confirmColor,
          icon: Icons.check_rounded,
        ),
      ],
    );
  }
}
