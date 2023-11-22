import 'package:flutter/material.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';

import '../../ioc_container.dart';
import '../constants/ui_constants.dart';

class ConfirmationDialog extends StatelessWidget {
  final String label;
  final String? description;
  late final Future<void> Function() _onConfirm;

  ConfirmationDialog(
      {super.key,
      required this.label,
      this.description,
      required Future<void> Function() onConfirm}) {
    _onConfirm = onConfirm;
  }

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
          Text(description ?? '', textAlign: TextAlign.center,),
          const SizedBox(
            height: STANDARD_PADDING,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StbElevatedButton(
                text: 'Cancel',
                stretch: true,
                onTap: () => _navRouter.returnBack()
              ),
              StbElevatedButton(
                text: 'Do it',
                stretch: true,
                onTap: () {
                  _onConfirm;
                  Navigator.of(context).pop;
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
