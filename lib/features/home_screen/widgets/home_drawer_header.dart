import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Text(AppLocalizations.of(context)!.settings),
          const CustomSpace(
            width: 10,
          ),
          const Icon(Icons.settings_outlined),
        ],
      ),
    );
  }
}
