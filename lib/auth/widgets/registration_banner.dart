import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:split_the_bill/common/constants/animation_asset.dart';

const _REGISTRATION_BANNER_HEIGHT = 200.0;

class RegistrationBanner extends StatelessWidget {
  const RegistrationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AnimationAsset.REGISTRATION.url,
      height: _REGISTRATION_BANNER_HEIGHT,
    );
  }
}