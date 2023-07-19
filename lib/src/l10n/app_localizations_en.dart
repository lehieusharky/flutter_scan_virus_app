import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get uploadFile => 'Upload file';

  @override
  String get scanFilePrivacy1 => 'By submitting data above, you are agreeing to our ';

  @override
  String get scanFilePrivacy2 => 'Terms of Service and Privacy Policy. ';

  @override
  String get scanFilePrivacy3 => 'Please do not submit any personal information. VirusTotal is not responsible for the contents of your submission.';

  @override
  String get uploadFileFailed => 'Upload file Failed';

  @override
  String get uploadFileFailedMessage => 'Check your Internet or your file again!';

  @override
  String get urlOfWebsite => 'URL of the website';

  @override
  String get search => 'Search';

  @override
  String get ipAddress => 'IP address';
}
