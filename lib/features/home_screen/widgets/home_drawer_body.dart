import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/language/language.dart';
import 'home_drawer_body_item.dart';

class AppDrawerBody extends StatelessWidget {
  const AppDrawerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        AppLocalizations.of(context)!.languages,
        style: context.textTheme.titleMedium,
      ),
      children: const [
        DrawerBodyItem(
          title: Language.turkish,
        ),
        DrawerBodyItem(
          title: Language.english,
        ),
      ],
    );
  }
}
