import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/scan_page/section/scan_url/bloc/scan_url_bloc.dart';
import 'package:virusscanapp/src/modules/scan_page/section/scan_url/widgets/form_scan_url.dart';
import 'package:virusscanapp/src/theme/assets.gen.dart';
import 'package:virusscanapp/src/widgets/custom_button.dart';
import 'package:virusscanapp/src/widgets/privacy_terms.dart';

class ScanUrlSection extends StatelessWidget {
  ScanUrlSection({super.key});

  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanUrlBloc(),
      child: BlocConsumer<ScanUrlBloc, ScanUrlState>(
        listener: (context, state) {
          if (state is ScanUrlGetIdSuccess) {
            log(state.id);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.h),
                GestureDetector(
                  onTap: () => _scanUrl(context),
                  child: Assets.icons.urlIcon.image(
                    width: 170.w,
                    height: 200.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: FormScanUrl(
                    formKey: _formKey,
                    urlController: _urlController,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  onPressed: () => _scanUrl(context),
                  content: AppLocalizations.of(context)!.search,
                ),
                SizedBox(height: 30.h),
                const PrivacyAndTermsWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  void _scanUrl(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context
          .read<ScanUrlBloc>()
          .add(ScanUrlGetId(url: _urlController.text.trim()));
    }
  }
}
