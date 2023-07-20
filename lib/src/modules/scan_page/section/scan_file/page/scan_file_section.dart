import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:virusscanapp/src/data/repositories/local/file_picker_repo.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/scan_page/section/scan_file/bloc/scan_file_bloc.dart';
import 'package:virusscanapp/src/route/route_path.dart';
import 'package:virusscanapp/src/widgets/privacy_terms.dart';
import 'package:virusscanapp/src/theme/assets.gen.dart';
import 'package:virusscanapp/src/widgets/custom_button.dart';
import 'package:virusscanapp/src/widgets/custom_dialog.dart';

class ScanFileSection extends StatefulWidget {
  const ScanFileSection({super.key});

  @override
  State<ScanFileSection> createState() => _ScanFileSectionState();
}

class _ScanFileSectionState extends State<ScanFileSection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanFileBloc(),
      child: BlocConsumer<ScanFileBloc, ScanFileState>(
        listener: (context, state) {
          if (state is ScanFileGetIdSuccess) {
            final String id = state.id;
            context.go("${RoutePath.analysisPage}?id=$id");
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    GestureDetector(
                      onTap: () => _scanFile(context),
                      child: Assets.icons.uploadFileIcon.image(
                        width: 170.w,
                        height: 200.h,
                      ),
                    ),
                    CustomButton(
                      onPressed: () => _scanFile(context),
                      content: AppLocalizations.of(context)!.uploadFile,
                    ),
                    SizedBox(height: 50.h),
                    const PrivacyAndTermsWidget(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _scanFile(BuildContext context) async {
    final FilePickerRepository filePicker = GetIt.I.get<FilePickerRepository>();

    try {
      final File file = await filePicker.getSingleFile();
      if (!mounted) return;
      context.read<ScanFileBloc>().add(ScanFileGetId(file: file));
    } catch (e) {
      _showExceptionDialog(context);
    }
  }

  void _showExceptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog.exception(
        title: AppLocalizations.of(context)!.uploadFileFailed,
        message: AppLocalizations.of(context)!.uploadFileFailedMessage,
        context: context,
      ),
    );
  }
}
