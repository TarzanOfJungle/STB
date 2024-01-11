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

const _MIN_TRAILING_WIDTH = 50.0;

class ShoppingMemberListTile extends StatelessWidget {
  final User user;
  final int currentUserId;
  final VoidCallback? onDelete;

  bool get _isCurrentUser => currentUserId == user.id;
  bool get _showDeleteButton => onDelete != null && currentUserId != user.id;
  int? get _ownerId =>
      _shoppingDetailController.currentShoppingState?.shopping.creatorId;

  ShoppingMemberListTile({
    super.key,
    this.onDelete,
    required this.user,
    required this.currentUserId,
  });

  final _shoppingDetailController = get<ShoppingDetailController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _ROW_PADDING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLeading(context),
          const SizedBox(width: STANDARD_PADDING),
          _buildText(context),
          const SizedBox(width: STANDARD_PADDING),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: _MIN_TRAILING_WIDTH),
            child: Center(child: _buildTrailing(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_LEADING_PADDING),
      decoration: BoxDecoration(
        color: _isCurrentUser
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
      ),
      child: Icon(
        _USER_ICON,
        color: _isCurrentUser
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.primary,
      ),
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

  Widget _buildTrailing(BuildContext context) {
    if (_showDeleteButton) {
      return _buildDeleteButton(context);
    } else if (_ownerId == user.id) {
      return _buildOwnerLabel();
    }
    return const SizedBox.shrink();
  }

  Widget _buildOwnerLabel() {
    return const Icon(Icons.star);
  }

  Widget _buildDeleteButton(BuildContext context) {
    return IconButtonWithBackground(
      onTap: () => onDelete?.call(),
      icon: _DELETE_ICON,
      scale: _DELETE_BUTTON_SCALE,
      backgroundColor: Theme.of(context).colorScheme.surface,
      iconColor: UiConstants.deleteColor,
    );
  }
}
