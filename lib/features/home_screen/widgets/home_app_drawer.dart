import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import 'home_drawer_body.dart';
import 'home_drawer_header.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * 0.6,
      child: ListView(
        children: const [
          AppDrawerHeader(),
          AppDrawerBody(),
        ],
      ),
    );
  }
}
