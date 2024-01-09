import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  String get monthAndYear => DateFormat('MMMM, y', 'en_US').format(this);
  String get fullDateAndHour => DateFormat('dd/MM/yyyy, HH:mm').format(this);

  String get dayName {
    return DateFormat('EEE', 'en_US').format(this);
  }

  DateTime get getLastMonday {
    DateTime today = DateTime.now();
    int dayOfWeek = today.weekday;
    int daysToSubtract = (dayOfWeek + 6) % 7;
    DateTime lastMonday = today.subtract(Duration(days: daysToSubtract));
    return lastMonday;
  }
}
