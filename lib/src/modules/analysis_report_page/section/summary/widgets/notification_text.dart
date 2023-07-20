import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class ShowMaliciousWidget extends StatelessWidget {
  final int malicious;

  const ShowMaliciousWidget({
    super.key,
    required this.malicious,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        malicious == 0
            ? AppLocalizations.of(context)!.noMaliciousNotification
            : "$malicious ${AppLocalizations.of(context)!.haveMaliciousNotification}",
        style: malicious == 0
            ? FontTheme.brightGreen20W500Inter
            : FontTheme.radicalRed20W500Inter,
        textAlign: TextAlign.center,
      ),
    );
  }
}
