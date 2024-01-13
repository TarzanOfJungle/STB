import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';

class FinalizedIndicator extends StatelessWidget {
  const FinalizedIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.done),
        SizedBox(width: SMALL_PADDING,),
      ],
    );
  }
}
