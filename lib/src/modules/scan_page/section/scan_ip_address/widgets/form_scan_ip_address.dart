import 'package:flutter/material.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/widgets/custom_text_form_field.dart';

class FormScanIPAddress extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController ipAddressController;

  const FormScanIPAddress({
    super.key,
    required this.formKey,
    required this.ipAddressController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFormField(
        autoFocus: true,
        controller: ipAddressController,
        keyboardType: TextInputType.text,
        hintText: AppLocalizations.of(context)!.ipAddress,
      ),
    );
  }
}
