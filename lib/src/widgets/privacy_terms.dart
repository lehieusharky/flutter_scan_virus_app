import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class PrivacyAndTermsWidget extends StatelessWidget {
  const PrivacyAndTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: AppLocalizations.of(context)!.scanFilePrivacy1,
                style: FontTheme.shark15W500Inter),
            TextSpan(
                text: AppLocalizations.of(context)!.scanFilePrivacy2,
                style: FontTheme.scienceBlue17W700Inter),
            TextSpan(
                text: AppLocalizations.of(context)!.scanFilePrivacy3,
                style: FontTheme.shark15W500Inter),
          ],
        ),
      ),
    );
  }
}
