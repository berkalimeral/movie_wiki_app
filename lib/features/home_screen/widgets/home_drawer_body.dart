import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/constants/app_constants.dart';
import 'home_drawer_body_item.dart';

class AppDrawerBody extends StatelessWidget {
  const AppDrawerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        AppConstants.languages.tr(),
        style: context.textTheme.titleMedium,
      ),
      children: [
        DrawerBodyItem(
          title: AppConstants.turkish.tr(),
        ),
        DrawerBodyItem(
          title: AppConstants.english.tr(),
        ),
      ],
    );
  }
}
