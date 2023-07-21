import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/my_app/bloc/my_app_bloc.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<MyAppBloc>(context).add(MyAppUpdateLanguage());
      },
      child: Text(
        AppLocalizations.of(context)!.changeLanguage,
        style: FontTheme.scienceBlue15W700Inter,
      ),
    );
  }
}
