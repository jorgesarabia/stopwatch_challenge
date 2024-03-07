import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stopwatch_challenge/models/saved_stopwatch.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';
import 'package:stopwatch_challenge/models/timer_model.dart';
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart';

import '../../data/mock_stopwatch_service_test.mocks.dart';

void main() {
  late StopwatchController stopwatchController;
  late MockStopwatchService mockStopwatchService;

  setUp(() {
    mockStopwatchService = MockStopwatchService();
    stopwatchController = StopwatchController(StopwatchModel.empty(), mockStopwatchService);
  });

  tearDown(() {
    stopwatchController.dispose();
  });

  test('initial values should be correct', () {
    expect(stopwatchController.isZero, true);
    expect(stopwatchController.isRuning, false);
    expect(stopwatchController.isStopped, false);
  });

  test('start and stop methods should work correctly', () {
    stopwatchController.start();
    expect(stopwatchController.isRuning, true);

    stopwatchController.stop();
    expect(stopwatchController.isStopped, true);
  });

  test('update tab should work correctly', () {
    expect(stopwatchController.tab, 0);

    stopwatchController.updateTab(1);
    expect(stopwatchController.tab, 1);

    stopwatchController.updateTab(3);
    expect(stopwatchController.tab, 3);
  });

  test('reset method should work correctly', () async {
    when(mockStopwatchService.saveStopwatch(
      stopwatchModel: anyNamed('stopwatchModel'),
      bestLap: anyNamed('bestLap'),
      worstLap: anyNamed('worstLap'),
    )).thenAnswer((_) => Future.value());

    stopwatchController.start();
    expect(stopwatchController.isRuning, true);

    stopwatchController.stop();
    expect(stopwatchController.isStopped, true);
    expect(stopwatchController.isRuning, false);

    stopwatchController.reset();

    await Future.delayed(const Duration(milliseconds: 200));

    expect(stopwatchController.isZero, true);
    expect(stopwatchController.isRuning, false);
    expect(stopwatchController.isStopped, false);
    expect(stopwatchController.stopwatchModel, StopwatchModel.empty());
    expect(stopwatchController.bestLap, -1);
    expect(stopwatchController.worstLap, -1);
  });

  test('getSavedStopwatches must call service getSavedStopwatches', () async {
    when(mockStopwatchService.getSavedStopwatches()).thenAnswer((realInvocation) => Future.value([]));

    final result = await stopwatchController.getSavedStopwatches();

    expect(result.isEmpty, isTrue);
    verify(mockStopwatchService.getSavedStopwatches()).called(1);
  });

  test('deleteHistory must call service deleteSavedStopwatches', () async {
    when(mockStopwatchService.deleteSavedStopwatches()).thenAnswer((realInvocation) => Future.value());

    await stopwatchController.deleteHistory();

    verify(mockStopwatchService.deleteSavedStopwatches()).called(1);
  });

  test('loadsavedStopwatch should work correctly', () {
    stopwatchController.updateTab(5);
    expect(stopwatchController.stopwatchModel, StopwatchModel.empty());
    expect(stopwatchController.bestLap, -1);
    expect(stopwatchController.worstLap, -1);
    expect(stopwatchController.tab, 5);

    const timer = TimerModel(totalMilliseconds: 10, partialMilliseconds: 10);
    const stopwatchModel = StopwatchModel(
      mainTimer: timer,
      laps: [timer],
    );

    final mockSavedStopwatch = SavedStopwatch(
      stopwatchModel: stopwatchModel,
      bestLap: 100,
      worstLap: 1000,
    );

    stopwatchController.loadSavedStopwatch(mockSavedStopwatch);
    expect(stopwatchController.stopwatchModel, stopwatchModel);
    expect(stopwatchController.bestLap, 100);
    expect(stopwatchController.worstLap, 1000);
    expect(stopwatchController.tab, 0);
  });

  // test('getLap should work correctly', () async {
  //   final fakeAsync = FakeAsync();
  //   fakeAsync.run((asyncFake) {
  //     StopwatchController localStopwatchController = StopwatchController(StopwatchModel.empty(), mockStopwatchService);

  //     localStopwatchController.updateTab(5);
  //     expect(localStopwatchController.stopwatchModel, StopwatchModel.empty());
  //     expect(localStopwatchController.bestLap, -1);
  //     expect(localStopwatchController.worstLap, -1);
  //     expect(localStopwatchController.tab, 5);

  //     const timer = TimerModel(totalMilliseconds: 10, partialMilliseconds: 10);
  //     const stopwatchModel = StopwatchModel(
  //       mainTimer: timer,
  //       laps: [timer],
  //     );

  //     final mockSavedStopwatch = SavedStopwatch(
  //       stopwatchModel: stopwatchModel,
  //       bestLap: 100,
  //       worstLap: 1000,
  //     );

  //     localStopwatchController.loadSavedStopwatch(mockSavedStopwatch);
  //     expect(localStopwatchController.stopwatchModel, stopwatchModel);
  //     expect(localStopwatchController.bestLap, 100);
  //     expect(localStopwatchController.worstLap, 1000);
  //     expect(localStopwatchController.tab, 0);

  //     localStopwatchController.start();

  //     asyncFake.elapse(const Duration(milliseconds: 200));

  //     localStopwatchController.getLap();
  //     // expect(
  //     //   localStopwatchController.stopwatchModel,
  //     //   stopwatchModel.copyWith(
  //     //     mainTimer: stopwatchModel.mainTimer.copyWith(totalMilliseconds: 20),
  //     //     laps: [stopwatchModel.laps.first, const TimerModel(totalMilliseconds: 20, partialMilliseconds: 10)],
  //     //   ),
  //     // );
  //     expect(localStopwatchController.bestLap, 10);
  //     // expect(localStopwatchController.worstLap, 1000);
  //     // expect(localStopwatchController.tab, 0);
  //   });
  // });
}
