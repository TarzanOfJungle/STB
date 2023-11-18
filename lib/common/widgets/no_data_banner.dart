import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:split_the_bill/common/constants/animation_asset.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

const _NO_DATA_BANNER_HEIGHT = 150.0;

class NoDataBanner extends StatelessWidget {
  final String? text;
  const NoDataBanner({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          AnimationAsset.NO_DATA.url,
          height: _NO_DATA_BANNER_HEIGHT,
        ),
        if (text != null) _buildTextDescription(text!)
      ],
    );
  }

  Widget _buildTextDescription(String text) {
    return Column(
      children: [
        const SizedBox(
          height: STANDARD_PADDING,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
