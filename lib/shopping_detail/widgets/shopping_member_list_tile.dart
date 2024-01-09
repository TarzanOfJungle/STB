import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/users/models/user/user.dart';

import '../../ioc_container.dart';

const _ROW_PADDING = 4.0;
const _LEADING_PADDING = 3.0;
const _USER_ICON = Icons.person_rounded;
const _DELETE_ICON = Icons.remove_rounded;
const _DELETE_BUTTON_SCALE = 0.7;

class ShoppingMemberListTile extends StatelessWidget {
  final User user;
  final int currentUserId;
  final VoidCallback? onDelete;

  bool get _isCurrentUser => currentUserId == user.id;
  bool get _showDeleteButton => onDelete != null && currentUserId != user.id;

  ShoppingMemberListTile({
    super.key,
    this.onDelete,
    required this.user,
    required this.currentUserId,
  });

  final _shoppingDetailController = get<ShoppingDetailController>();

  @override
  Widget build(BuildContext context) {
    var ownerId = _shoppingDetailController.currentShoppingState?.shopping.creatorId;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _ROW_PADDING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLeading(context),
          const SizedBox(width: STANDARD_PADDING),
          _buildText(context),
          const SizedBox(width: STANDARD_PADDING),
          if (ownerId == user.id) _buildOwnerLabel(),
          if (_showDeleteButton) _buildDeleteButton(),
        ],
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_LEADING_PADDING),
      decoration: BoxDecoration(
        color: _isCurrentUser
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(_USER_ICON),
    );
  }

  Widget _buildText(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            user.email,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerLabel() {
    return const Icon(Icons.star);
  }

  Widget _buildDeleteButton() {
    return IconButtonWithBackground(
      onTap: () => onDelete?.call(),
      icon: _DELETE_ICON,
      scale: _DELETE_BUTTON_SCALE,
      backgroundColor: UiConstants.infoColor,
      iconColor: UiConstants.deleteColor,
    );
  }
}
