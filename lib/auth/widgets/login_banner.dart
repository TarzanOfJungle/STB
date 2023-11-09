import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:split_the_bill/common/constants/animation_asset.dart';

const _LOGIN_BANNER_HEIGHT = 200.0;

class LoginBanner extends StatelessWidget {
  const LoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Lottie.asset(
        AnimationAsset.LOGIN.url,
        height: _LOGIN_BANNER_HEIGHT,
      ),
    );
  }
}
