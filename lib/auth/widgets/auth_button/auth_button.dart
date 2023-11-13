import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/widgets/auth_button/auth_button_display_type.dart';
import 'package:split_the_bill/common/services/internet_connectivity_service.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/stb_elevated_button.dart';
import 'package:split_the_bill/ioc_container.dart';

class AuthButton extends StatelessWidget {
  final _authController = get<AuthController>();
  final _internetConnectivityService = get<InternetConnectivityService>();

  final String title;
  final String noInternetMessage;
  final IconData icon;
  final VoidCallback onTap;

  AuthButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.noInternetMessage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _getButtonStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingIndicator();
        }
        switch (snapshot.data!) {
          case AuthButtonDisplayType.LOADING:
            return const LoadingIndicator();
          case AuthButtonDisplayType.NO_INTERNET:
            return _buildNoInternetBanner();
          case AuthButtonDisplayType.SHOWN:
            return _buildButton();
        }
      },
    );
  }

  Stream<AuthButtonDisplayType> _getButtonStream() {
    return Rx.combineLatest2(
      _authController.isLoadingStream,
      _internetConnectivityService.isConnectedToInternetStream,
      (isLoading, isConnectedToInternet) {
        if (!isConnectedToInternet) {
          return AuthButtonDisplayType.NO_INTERNET;
        }
        if (isLoading) {
          return AuthButtonDisplayType.LOADING;
        }
        return AuthButtonDisplayType.SHOWN;
      },
    );
  }

  Widget _buildButton() {
    return StbElevatedButton(
      text: title,
      leadingIcon: icon,
      onTap: onTap,
    );
  }

  Widget _buildNoInternetBanner() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.wifi_off_rounded),
        const SizedBox(width: 15),
        Text(noInternetMessage)
      ],
    );
  }
}
