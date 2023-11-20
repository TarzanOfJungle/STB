import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';

const _ROW_ICON_SIZE = 20.0;

class UserPurchaseListTile extends StatelessWidget {
  final UserWithPurchaseContext userPurchase;
  final bool isCurrentUser;
  final IconData quantityIcon;
  final IconData ammountIcon;

  double get _fontSize => isCurrentUser ? 17 : 13;
  FontWeight get _numbersFontWeight =>
      isCurrentUser ? FontWeight.bold : FontWeight.normal;

  const UserPurchaseListTile({
    super.key,
    required this.userPurchase,
    required this.isCurrentUser,
    required this.quantityIcon,
    required this.ammountIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
        color: isCurrentUser
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUsername(),
          _buildTextWithPrefixIcon(
            text: userPurchase.quantity.toString(),
            icon: quantityIcon,
          ),
          _buildTextWithPrefixIcon(
            text: userPurchase.ammountPurchased.toStringAsFixed(2),
            icon: ammountIcon,
          ),
        ],
      ),
    );
  }

  Widget _buildUsername() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isCurrentUser) const Icon(Icons.person_rounded),
          Expanded(
            child: Text(
              userPurchase.user.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextWithPrefixIcon({
    required String text,
    required IconData icon,
  }) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: _ROW_ICON_SIZE,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
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
