import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopwatch_challenge/data/stopwatch_service.dart';
import 'package:stopwatch_challenge/models/saved_stopwatch.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';
import 'package:stopwatch_challenge/models/timer_model.dart';

void main() {
  late StopwatchService stopwatchService;
  late SharedPreferences preferences;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    preferences = await SharedPreferences.getInstance();
    stopwatchService = StopwatchService(preferences);
  });

  test('getSavedStopwatches returns a value after saving', () async {
    const timer = TimerModel(totalMilliseconds: 10, partialMilliseconds: 10);
    const stopwatchModel = StopwatchModel(
      mainTimer: timer,
      laps: [timer],
    );

    await stopwatchService.saveStopwatch(stopwatchModel: stopwatchModel, bestLap: 10, worstLap: 100);

    final result = await stopwatchService.getSavedStopwatches();
    expect(result.isEmpty, isFalse);
    expect(result.first, const TypeMatcher<SavedStopwatch>());
    expect(result.first.bestLap, 10);
    expect(result.first.worstLap, 100);
  });

  test('getSavedStopwatches returns empty list if there are not entries saved', () async {
    final result = await stopwatchService.getSavedStopwatches();
    expect(result.isEmpty, isTrue);
  });

  test('getSavedStopwatches returns empty after delete all the storage', () async {
    final timerList = List.generate(10, (index) {
      final timer = TimerModel(totalMilliseconds: 10 * index, partialMilliseconds: index);

      final stopwatchModel = StopwatchModel(
        mainTimer: timer,
        laps: [timer, timer, timer],
      );

      return stopwatchModel;
    });

    for (int x = 0; x < timerList.length; x++) {
      await stopwatchService.saveStopwatch(stopwatchModel: timerList[x], bestLap: x, worstLap: 10 * x);
    }

    final result = await stopwatchService.getSavedStopwatches();
    expect(result.isEmpty, isFalse);
    expect(result.length, timerList.length);

    for (int x = 0; x < timerList.length; x++) {
      expect(result[x].stopwatchModel, timerList[x]);
      expect(result[x].bestLap, x);
      expect(result[x].worstLap, 10 * x);
    }

    await stopwatchService.deleteSavedStopwatches();

    final resultAfterDelete = await stopwatchService.getSavedStopwatches();
    expect(resultAfterDelete.isEmpty, isTrue);
  });
}
