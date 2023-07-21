import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/data/providers/local/language_app_provider.dart';

abstract class LanguageAppRepository {
  Future<String> getDefaultLanguage();

  Future<String> updateLanguage();
}

@Injectable(as: LanguageAppRepository)
class LanguageAppRepositoryImpl extends LanguageAppRepository {
  final LanguageAppProvider _appLanguageProvider =
      GetIt.I.get<LanguageAppProvider>();

  @override
  Future<String> getDefaultLanguage() async {
    return await _appLanguageProvider.getDefaultLanguage();
  }

  @override
  Future<String> updateLanguage() async {
    return await _appLanguageProvider.updateLanguage();
  }
}
