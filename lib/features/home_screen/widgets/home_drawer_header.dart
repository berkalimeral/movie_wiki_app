import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/custom_colors.dart';
import '../../../core/widgets/custom_space.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      curve: Curves.easeInBack,
      decoration: BoxDecoration(
        color: CustomColorsDark.cardColor,
      ),
      child: Row(
        children: [
          Text(AppConstants.settings.tr()),
          const CustomSpace(
            width: 10,
          ),
          const Icon(Icons.settings_outlined),
        ],
      ),
    );
  }
}
