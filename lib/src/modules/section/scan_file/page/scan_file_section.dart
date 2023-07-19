import 'package:flutter/material.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/widgets/custom_button.dart';

class ScanFileSection extends StatelessWidget {
  const ScanFileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          onPressed: () {},
          content: AppLocalizations.of(context)!.uploadFile,
        ),
      ],
    );
  }
}
