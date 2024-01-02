import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/user_text_avatar.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/users/controllers/friends_controller.dart';
import 'package:split_the_bill/users/models/friendship_request/friendship_request.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class NonFriendUserDetailDialog extends StatelessWidget {
  final User user;
  final FriendshipRequest? relatedFriendshipRequest;

  final _navRouter = get<NavRouter>();
  final _authController = get<AuthController>();
  final _friendsController = get<FriendsController>();

  NonFriendUserDetailDialog({
    super.key,
    required this.user,
    this.relatedFriendshipRequest,
  });

  int? get _loggedInUserId => _authController.loggedInUser?.id;

  bool get _friendshipRequestSent {
    return relatedFriendshipRequest != null &&
        relatedFriendshipRequest!.applicant.id == _loggedInUserId &&
        relatedFriendshipRequest!.acceptant.id != _loggedInUserId;
  }

  bool get _loggedInUserIsAcceptant {
    return relatedFriendshipRequest != null &&
        relatedFriendshipRequest!.applicant.id != _loggedInUserId &&
        relatedFriendshipRequest!.acceptant.id == _loggedInUserId;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          UserTextAvatar(
            user: user,
            backgroundColor: Theme.of(context).colorScheme.primary,
            letterSize: 35,
          ),
          Text(
            user.username,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            user.email,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: STANDARD_PADDING),
          _buildInfoText(),
          const SizedBox(height: STANDARD_PADDING),
          _buildActionSection(),
        ],
      ),
    ));
  }

  Widget _buildInfoText() {
    if (relatedFriendshipRequest == null) {
      return const SizedBox.shrink();
    }
    final icon = _friendshipRequestSent
        ? Icons.arrow_circle_right_rounded
        : Icons.pending_rounded;
    final text = _friendshipRequestSent
        ? "You already sent a request for friendship"
        : "User has requested your friendship";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: SMALL_PADDING),
        Expanded(child: Text(text)),
      ],
    );
  }

  Widget _buildActionSection() {
    if (relatedFriendshipRequest == null) {
      return _buildRequestFriendshipButton();
    }
    if (_friendshipRequestSent) {
      return _buildCancelFriendshipRequestButton();
    }
    if (_loggedInUserIsAcceptant) {
      return _buildUpdateRequestButtons();
    }
    return const SizedBox.shrink();
  }

  Widget _buildRequestFriendshipButton() {
    return StbElevatedButton(
      text: "Request friendship",
      leadingIcon: Icons.person_add_rounded,
      onTap: () => _closeDialogWithAction(
        () => _friendsController.sendFriendshipRequest(user.id),
      ),
    );
  }

  Widget _buildCancelFriendshipRequestButton() {
    return StbElevatedButton(
      text: "Cancel request",
      leadingIcon: Icons.close_rounded,
      onTap: () => _closeDialogWithAction(
        () => _friendsController.cancelFriendshipRequest(user.id),
      ),
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
        StbElevatedButton(
          text: "Decline",
          onTap: () => _closeDialogWithAction(
            () => _friendsController.updateFriendshipRequestStatus(
              applicantId: relatedFriendshipRequest!.applicant.id,
              accept: false,
            ),
          ),
          color: UiConstants.infoColor,
          leadingIcon: Icons.close_rounded,
        ),
        const SizedBox(width: STANDARD_PADDING),
        StbElevatedButton(
          text: "Accept",
          onTap: () => _closeDialogWithAction(
            () => _friendsController.updateFriendshipRequestStatus(
              applicantId: relatedFriendshipRequest!.applicant.id,
              accept: true,
            ),
          ),
          color: UiConstants.confirmColor,
          leadingIcon: Icons.check_rounded,
        ),
      ],
    );
  }

  void _closeDialogWithAction(VoidCallback action) {
    action();
    _navRouter.returnBack();
  }
}
