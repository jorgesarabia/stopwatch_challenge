import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_challenge/utils/extensions/date_formatter_extension.dart';

void main() {
  group('DateFormatterExtension', () {
    test('savedAtStyle should return formatted date and time', () {
      final date = DateTime(2024, 3, 1, 14, 30);

      final formattedDateTime = date.savedAtStyle;

      expect(formattedDateTime, 'March 1 at 2:30 PM');
    });

    test('savedAtStyle should return current date and time if DateTime is null', () {
      final currentFormatted = DateTime.now().savedAtStyle;

      final formattedDateTime = null.savedAtStyle;

      expect(formattedDateTime, currentFormatted);
    });
  });
}
