import 'package:intl/intl.dart';
// ///package:my_rick_and_morty/
import '../logger.dart';

const appDatePattern = 'yyyy/MM/dd';
const checkInDatePattern = "yyyy-MM-dd" ;
const appTimePattern = 'hh:mm a';
const checkInTimePattern = 'hh:mm';

DateTime stringDateToDateTime(String date) {
  return DateTime.parse(date);
}

DateTime stringServerPublicToDateTime(String stringDate) {
  /// ex: "2021-02-04 01:29 PM" -> DateTime().toString()
  /// -> 2021-02-04 13:29:00.000
  log('DateUtils', 'stringServerPublicToDateTime:  $stringDate');

  return Intl.withLocale(
      'en', () => DateFormat("yyyy-MM-dd hh:mm a").parse(stringDate));
}

String dateToAppDate(DateTime date) {
  return DateFormat(appDatePattern).format(date);
}

extension ToAppDate on DateTime {
  String toAppDate() {
    return dateToAppDate(this);
  }

    String toCheckInDate() {
    return DateFormat(checkInDatePattern).format(this);
  }
    String toCheckInTime() {
    return DateFormat(checkInTimePattern).format(this);
  }

  String toAppTime() {
    return DateFormat(appTimePattern).format(this);
  }

  String toTimeIfToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final thisDate = DateTime(year, month, day);

    if (thisDate == today) {
      return toAppTime();
    }
    return toAppDate();
  }
}
