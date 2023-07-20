import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String value;

  const DetailItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: FontTheme.shark18W500Inter,
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () async {
                await _copyValue(context);
              },
              child: Text(
                value,
                maxLines: 2,
                style: FontTheme.scienceBlue15W700Inter,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _copyValue(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: value)).then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Center(
            child: Text(AppLocalizations.of(context)!.copied,
                style: FontTheme.scienceBlue15W700Inter),
          ),
        ),
      ),
    );
  }
}
