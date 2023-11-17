import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import 'login_button.dart';
import 'text_input_area.dart';

class LoginBody extends ConsumerStatefulWidget {
  const LoginBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginBodyState();
}

class _LoginBodyState extends ConsumerState<LoginBody> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Attributes().longPadding,
          vertical: Attributes().scaffoldPaddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Attributes().scaffoldPaddingVertical,
            ),
            child: Text(
              AppLocalizations.of(context)!.login_txt,
              style: context.textTheme.bodyMedium!.copyWith(
                color: CustomColorsDark.surface,
              ),
            ),
          ),
          TextInputArea(
            label: AppLocalizations.of(context)!.username.toUpperCase(),
            hintText: AppLocalizations.of(context)!.username_hint,
            controller: _usernameController,
          ),
          TextInputArea(
            label: AppLocalizations.of(context)!.password.toUpperCase(),
            hintText: AppLocalizations.of(context)!.password_hint,
            controller: _passwordController,
            isPassword: true,
          ),
          LoginButton(
              usernameController: _usernameController,
              passwordController: _passwordController,
              ref: ref),
        ],
      ),
    );
  }
}
