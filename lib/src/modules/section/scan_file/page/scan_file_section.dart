import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:virusscanapp/src/data/providers/local/file_picker_provider.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/section/scan_file/bloc/scan_file_bloc.dart';
import 'package:virusscanapp/src/widgets/custom_button.dart';

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
            log(state.id);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () => _scanFile(context),
                content: AppLocalizations.of(context)!.uploadFile,
              ),
            ],
          );
        },
      ),
    );
  }

  void _scanFile(BuildContext context) async {
    final FilePickerProvider filePickerProvider =
        GetIt.I.get<FilePickerProvider>();
    final File file = await filePickerProvider.getSingleFile();
    if (!mounted) return;
    context.read<ScanFileBloc>().add(ScanFileGetId(file: file));
  }
}
