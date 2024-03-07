import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_challenge/utils/extensions/time_formatter_extension.dart';

void main() {
  group('TimeFormatterExtension', () {
    test('toStopwatchStyle should return formatted time string', () {
      const milliseconds = 123456;
      const expectedTimeString = '02:03.45';

      final formattedTimeString = milliseconds.toStopwatchStyle;

      expect(formattedTimeString, expectedTimeString);
    });

    test('toStopwatchStyle should handle single digit minutes and seconds', () {
      const milliseconds = 1234;
      const expectedTimeString = '00:01.23';

      final formattedTimeString = milliseconds.toStopwatchStyle;

      expect(formattedTimeString, expectedTimeString);
    });

    test('toStopwatchStyle should handle milliseconds less than 10', () {
      const milliseconds = 6012;
      const expectedTimeString = '00:06.01';

      final formattedTimeString = milliseconds.toStopwatchStyle;

      expect(formattedTimeString, expectedTimeString);
    });
  });
}
