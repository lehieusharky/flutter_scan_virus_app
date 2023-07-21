import 'package:intl/intl.dart';

class DateTimeUtils {
  static String convertIntToDateTime({required int number}) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(number * 1000);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    return formattedDate;
  }
}
