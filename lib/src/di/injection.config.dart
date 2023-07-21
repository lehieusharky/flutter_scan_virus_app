// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:virusscanapp/src/data/providers/local/file_picker_provider.dart'
    as _i3;
import 'package:virusscanapp/src/data/providers/local/language_app_provider.dart'
    as _i7;
import 'package:virusscanapp/src/data/providers/remote/get_analysis_report.dart'
    as _i5;
import 'package:virusscanapp/src/data/providers/remote/scan_file_provider.dart'
    as _i9;
import 'package:virusscanapp/src/data/providers/remote/scan_url_provider.dart'
    as _i11;
import 'package:virusscanapp/src/data/repositories/local/file_picker_repo.dart'
    as _i4;
import 'package:virusscanapp/src/data/repositories/local/language_app_repo.dart'
    as _i8;
import 'package:virusscanapp/src/data/repositories/remote/get_analysis_report_repo.dart'
    as _i6;
import 'package:virusscanapp/src/data/repositories/remote/scan_file_repo.dart'
    as _i10;
import 'package:virusscanapp/src/data/repositories/remote/scan_url_repo.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FilePickerProvider>(() => _i3.FilePickerProviderImpl());
    gh.factory<_i4.FilePickerRepository>(() => _i4.FilePickerRepositoryImpl());
    gh.factory<_i5.GetAnalysisReportProvider>(
        () => _i5.GetAnalysisReportProviderImpl());
    gh.factory<_i6.GetAnalysisReportRepository>(
        () => _i6.GetAnalysisReportRepositoryImpl());
    gh.factory<_i7.LanguageAppProvider>(() => _i7.LanguageAppProviderImpl());
    gh.factory<_i8.LanguageAppRepository>(
        () => _i8.LanguageAppRepositoryImpl());
    gh.factory<_i9.ScanFileProvider>(() => _i9.ScanFileProviderImpl());
    gh.factory<_i10.ScanFileRepository>(() => _i10.ScanFileRepositoryImpl());
    gh.factory<_i11.ScanUrlProvider>(() => _i11.ScanUrlProviderImpl());
    gh.factory<_i12.ScanUrlRepository>(() => _i12.ScanUrlRepositoryImpl());
    return this;
  }
}
