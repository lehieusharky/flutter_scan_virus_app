import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';

abstract class LanguageAppProvider {
  Future<String> getDefaultLanguage();

  Future<String> updateLanguage();
}

@Injectable(as: LanguageAppProvider)
class LanguageAppProviderImpl implements LanguageAppProvider {
  @override
  Future<String> getDefaultLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool(TextConstant.isFirstTime) ?? true;
    String languageCode = TextConstant.vi;
    if (isFirstTime) {
      languageCode = Platform.localeName.split('_')[0];
    } else {
      languageCode =
          prefs.getString(TextConstant.languageCode) ?? TextConstant.vi;
    }
    prefs.setString(TextConstant.languageCode, languageCode);
    return languageCode;
  }

  @override
  Future<String> updateLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(TextConstant.languageCode)!;
    if (languageCode == TextConstant.vi) {
      prefs.setString(TextConstant.languageCode, TextConstant.en);
    } else {
      prefs.setString(TextConstant.languageCode, TextConstant.vi);
    }
    languageCode = prefs.getString(TextConstant.languageCode)!;
    return languageCode;
  }
}
