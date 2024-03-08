import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart';

import 'mock_stopwatch_controller.mocks.dart';

@GenerateMocks([StopwatchController])
void main() {
  test('the mock exists', () {
    expect(MockStopwatchController(), const TypeMatcher<StopwatchController>());
  });
}
