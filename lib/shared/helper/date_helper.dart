import 'package:intl/intl.dart';

String formatDate({required String pattern, required DateTime date}) {
  return DateFormat(pattern).format(date);
}