import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/products/providers/login_provider/login_provider.dart';

import '../../../core/utils/attributes/attributes.dart';
import '../../../products/models/user/login_request_model.dart';
import '../../home_screen/view/home_screen.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Attributes().scaffoldPaddingHorizontal),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Login to Movie and TV Series app via TMDb',
              textAlign: TextAlign.center,
            ),
            TextInputArea(
              label: 'USERNAME',
              hintText: 'Enter TDMb username here..',
              controller: _usernameController,
            ),
            TextInputArea(
              label: 'PASSWORD',
              hintText: 'Enter password here..',
              controller: _passwordController,
              isPassword: true,
            ),
            ElevatedButton(
                onPressed: () async {
                  final param = LoginRequestModel(
                      username: _usernameController.text,
                      password: _passwordController.text);
                  final isSuccess = await ref.read(loginProvider).call(param);
                  if (isSuccess) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
                  } else {
                    log('Error');
                  }
                },
                child: Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
