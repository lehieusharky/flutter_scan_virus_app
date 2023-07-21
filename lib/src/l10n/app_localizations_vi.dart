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

  @override
  String get uploadFileFailed => 'Tải tệp tin thất bại';

  @override
  String get uploadFileFailedMessage => 'Kiểm tra mạng hoặc tệp tin của bạn!';

  @override
  String get urlOfWebsite => 'Đường dẫn của trang web';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get ipAddress => 'Địa chỉ IP';

  @override
  String get summary => 'Tóm tắt';

  @override
  String get detection => 'Phát hiện';

  @override
  String get details => 'Thông tin';

  @override
  String get noMaliciousNotification => 'Không có nhà cung cấp bảo mật nào gắn cờ là độc hại';

  @override
  String get haveMaliciousNotification => ' nhà cung cấp bảo mật đã gắn cờ là độc hại.';

  @override
  String get copied => 'Đã sao chép';

  @override
  String get scanUrlFailed => 'Kiểm tra url thất bại';

  @override
  String get scanFileFailedMessage => 'Hãy kiểm tra lại cú pháp đường dẫn.';

  @override
  String get changeLanguage => 'en';
}
