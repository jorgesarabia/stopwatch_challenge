import 'package:intl/intl.dart';

extension DateFormatterExtension on DateTime? {
  String get savedAtStyle {
    final date = this ?? DateTime.now();
    final dateFormat = DateFormat.MMMMd('en_US');
    final timeFormat = DateFormat.jm('en_US');
    final formattedDate = dateFormat.format(date);
    final formattedTime = timeFormat.format(date);
    return '$formattedDate at $formattedTime';
  }
}
