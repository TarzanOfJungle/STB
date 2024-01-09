import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';

const _ROW_ICON_SIZE = 20.0;

class UserPurchaseListTile extends StatelessWidget {
  final UserWithPurchaseContext userPurchase;
  final bool isCurrentUser;

  double get _fontSize => isCurrentUser ? 17 : 13;
  FontWeight get _numbersFontWeight =>
      isCurrentUser ? FontWeight.bold : FontWeight.normal;

  const UserPurchaseListTile({
    super.key,
    required this.userPurchase,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
        color: _getBackgroundColor(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUsername(context),
          const SizedBox(height: SMALL_PADDING),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTextWithPrefixIcon(
                context: context,
                text: userPurchase.quantity.toString(),
                icon: UiConstants.quantityIcon,
              ),
              _buildTextWithPrefixIcon(
                context: context,
                text: userPurchase.ammountPurchased.toStringAsFixed(2),
                icon: UiConstants.ammountIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUsername(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isCurrentUser)
          Icon(
            Icons.person_rounded,
            color: _getForegroundColor(context),
          ),
        Flexible(
          child: Text(
            userPurchase.user.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _fontSize,
                color: _getForegroundColor(context)),
          ),
        ),
      ],
    );
  }

  Widget _buildTextWithPrefixIcon({
    required BuildContext context,
    required String text,
    required IconData icon,
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: _ROW_ICON_SIZE,
            color: _getForegroundColor(context),
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: _fontSize,
                fontWeight: _numbersFontWeight,
                color: _getForegroundColor(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    return isCurrentUser
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.surface;
  }

  Color _getForegroundColor(BuildContext context) {
    return isCurrentUser
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSurface;
  }
}
