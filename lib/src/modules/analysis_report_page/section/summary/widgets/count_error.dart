import 'package:flutter/material.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class CountErrorWidget extends StatelessWidget {
  final int malicious;
  final int total;

  const CountErrorWidget({
    super.key,
    required this.malicious,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$malicious",
          style: 0 == 0
              ? FontTheme.brightGreen40W700Inter
              : FontTheme.radicalRed40W700Inter,
        ),
        Text(
          '/ $total',
          style: FontTheme.shark15W500Inter,
        ),
      ],
    );
  }
}
