import 'package:flutter/material.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';

import '../../../ioc_container.dart';
import '../../constants/ui_constants.dart';

class ConfirmationDialog extends StatelessWidget {
  final String label;
  final String? description;
  final String confirmText;
  final String cancelText;
  final Color confirmColor;
  final Color cancelColor;
  final Future<void> Function() onConfirm;

  ConfirmationDialog({
    required this.label,
    required this.onConfirm,
    this.confirmText = "Do it",
    this.cancelText = "Cancel",
    this.confirmColor = UiConstants.deleteColor,
    this.cancelColor = UiConstants.infoColor,
    this.description,
    super.key,
  });

  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(STANDARD_BORDER_RADIUS))),
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            description ?? '',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: STANDARD_PADDING,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StbElevatedButton(
                text: cancelText,
                stretch: true,
                onTap: () => _navRouter.returnBack(),
                color: cancelColor,
              ),
              StbElevatedButton(
                text: confirmText,
                stretch: true,
                onTap: () {
                  onConfirm();
                  _navRouter.returnBack();
                },
                color: confirmColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
