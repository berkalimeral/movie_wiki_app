import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Attributes().scaffoldPaddingHorizontal,
                  vertical: Attributes().scaffoldPaddingVertical),
              child: Image.asset(Assets.images.b3PNG),
            ),
            LoginBody(),
          ],
        ),
      ),
    );
  }
}
