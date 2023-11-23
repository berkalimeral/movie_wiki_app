import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/attributes/attributes.dart';
import '../../../products/models/user/login_request_model.dart';
import '../../../products/providers/login_provider/login_provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required this.ref,
  })  : _usernameController = usernameController,
        _passwordController = passwordController;

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: Attributes().scaffoldPaddingVertical),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () async {
            final param = LoginRequestModel(
                username: _usernameController.text,
                password: _passwordController.text);
            final isSuccess =
                await ref.read(loginProvider.notifier).call(param);
            if (isSuccess) {
            } else {
              log('Error');
            }
          },
          child: Text(AppLocalizations.of(context)!.sign_in)),
    );
  }
}
