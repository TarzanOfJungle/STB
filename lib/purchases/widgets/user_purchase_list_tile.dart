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
        color: isCurrentUser
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUsername(),
          const SizedBox(height: SMALL_PADDING),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTextWithPrefixIcon(
                text: userPurchase.quantity.toString(),
                icon: UiConstants.quantityIcon,
              ),
              _buildTextWithPrefixIcon(
                text: userPurchase.ammountPurchased.toStringAsFixed(2),
                icon: UiConstants.ammountIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUsername() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isCurrentUser) const Icon(Icons.person_rounded),
        Flexible(
          child: Text(
            userPurchase.user.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _fontSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextWithPrefixIcon({
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
