import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  String get toMonthShortcut {
    DateFormat formatter = DateFormat('MMM');
    return formatter.format(this);
  }
}
