import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_button.dart';

class ProfileTile extends StatelessWidget {
  final String label;
  final String? displayedValue;
  final VoidCallback onEdit;
  final bool showEditButton;
  final String buttonLabel;

  const ProfileTile({
    super.key,
    required this.label,
    this.displayedValue,
    required this.onEdit,
    this.showEditButton = true,
    this.buttonLabel = 'Edit',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
      ),
      child: Padding(
        padding: const EdgeInsets.all(STANDARD_PADDING),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$label:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  displayedValue ?? '',
                ),
              ],
            ),
            _buildEditButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    if (showEditButton) {
      return StbTextButton(
        onTap: onEdit,
        text: buttonLabel,
      );
    }
    return const SizedBox.shrink();
  }
}
