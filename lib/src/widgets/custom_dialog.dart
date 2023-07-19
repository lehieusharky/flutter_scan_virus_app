import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final VoidCallback onClosePressed;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onClosePressed,
    this.titleStyle,
    this.messageStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: titleStyle,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: messageStyle,
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: onClosePressed,
            child: Text(
              'Close',
              style: FontTheme.scienceBlue15W700Inter,
            ),
          ),
        ),
      ],
    );
  }

  factory CustomDialog.exception({
    required String title,
    required String message,
    void Function()? onClosePressed,
    required BuildContext context,
  }) {
    return CustomDialog(
      title: title,
      message: message,
      onClosePressed: onClosePressed ?? () => context.pop(true),
    );
  }
}
