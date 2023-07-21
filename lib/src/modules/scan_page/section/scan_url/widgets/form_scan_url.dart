import 'package:flutter/material.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/widgets/custom_text_form_field.dart';

class FormScanUrl extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController urlController;

  const FormScanUrl({
    super.key,
    required this.formKey,
    required this.urlController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFormField(
        autoFocus: true,
        controller: urlController,
        keyboardType: TextInputType.text,
        hintText: AppLocalizations.of(context)!.urlOfWebsite,
      ),
    );
  }
}
