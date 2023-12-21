import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:split_the_bill/common/constants/animation_asset.dart';

const _DEFAULT_TEXT = "Something went wrong";
const _ERROR_BANNER_HEIGHT = 190.0;

class ErrorBanner extends StatelessWidget {
  final String text;
  const ErrorBanner({
    super.key,
    this.text = _DEFAULT_TEXT,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LottieBuilder.asset(
          AnimationAsset.ERROR.url,
          height: _ERROR_BANNER_HEIGHT,
        ),
        _buildTextDescription(),
      ],
    );
  }

  Widget _buildTextDescription() {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
