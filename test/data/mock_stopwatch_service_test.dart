import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:stopwatch_challenge/data/stopwatch_service.dart';

import 'mock_stopwatch_service_test.mocks.dart';

@GenerateMocks([StopwatchService])
void main() {
  test('the mock exists', () {
    expect(MockStopwatchService(), const TypeMatcher<StopwatchService>());
  });
}
