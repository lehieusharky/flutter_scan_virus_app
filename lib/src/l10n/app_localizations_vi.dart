import 'app_localizations.dart';

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get uploadFile => 'Gửi file';

  @override
  String get scanFilePrivacy1 => 'Bằng cách gửi dữ liệu ở trên, bạn đồng ý với chúng tôi ';

  @override
  String get scanFilePrivacy2 => 'Điều khoản dịch vụ và Chính sách bảo mật. ';

  @override
  String get scanFilePrivacy3 => 'Vui lòng không gửi bất kỳ thông tin cá nhân nào. VirusTotal không chịu trách nhiệm về nội dung gửi của bạn.';
}
