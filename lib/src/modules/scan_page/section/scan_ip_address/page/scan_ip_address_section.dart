import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/scan_page/section/scan_ip_address/widgets/form_scan_ip_address.dart';
import 'package:virusscanapp/src/theme/assets.gen.dart';
import 'package:virusscanapp/src/widgets/custom_button.dart';

class ScanIPAddressSection extends StatelessWidget {
  ScanIPAddressSection({super.key});

  final _formKey = GlobalKey<FormState>();
  final _ipAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70.h),
        GestureDetector(
          onTap: () => _scanIPAddress(context),
          child: Assets.icons.ipIcon.image(
            width: 170.w,
            height: 200.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: FormScanIPAddress(
            formKey: _formKey,
            ipAddressController: _ipAddressController,
          ),
        ),
        SizedBox(height: 10.h),
        CustomButton(
          onPressed: () => _scanIPAddress(context),
          content: AppLocalizations.of(context)!.search,
        ),
      ],
    );
  }

  void _scanIPAddress(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {}
  }
}
