import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../core/utils/attributes/attributes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        Assets.images.b3PNG,
        fit: BoxFit.contain,
        height: 120,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: Attributes().appBarElevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
