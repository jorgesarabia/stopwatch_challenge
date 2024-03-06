import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:stopwatch_challenge/data/stopwatch_service.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

import '../../models/saved_stopwatch.dart';

@injectable
class StopwatchController extends ChangeNotifier {
  StopwatchController(this.stopwatchModel, this._stopwatchService) {
    _timer = Timer.periodic(const Duration(milliseconds: 2), _onTimerTick);
    _stopwatch = Stopwatch();
  }

  late final Timer _timer;
  late final Stopwatch _stopwatch;
  int _initialMilliseconds = 0;
  int _totalMilliseconds = 0;

  final StopwatchService _stopwatchService;
  StopwatchModel stopwatchModel;

  int bestLap = -1;
  int worstLap = -1;

  int tab = 0;

  final _timerController = StreamController<int>();
  Stream<int> get timerStream => _timerController.stream;

  bool get isZero => _stopwatch.elapsedMicroseconds == 0;
  bool get isRuning => _stopwatch.isRunning;
  bool get isStopped => !isZero && !isRuning;

  void _onTimerTick(Timer timer) {
    if (_stopwatch.isRunning) {
      _totalMilliseconds = _initialMilliseconds + _stopwatch.elapsedMilliseconds;
      _timerController.add(_totalMilliseconds);
    }
  }

  void updateTab(int newTab) {
    tab = newTab;
    notifyListeners();
  }

  void start() {
    _stopwatch.start();
    notifyListeners();
  }

  void stop() {
    _stopwatch.stop();
    notifyListeners();
  }

  void reset() {
    _stopwatchService.saveStopwatch(stopwatchModel: stopwatchModel, bestLap: bestLap, worstLap: worstLap);
    _stopwatch.reset();
    _timerController.add(0);
    stopwatchModel = StopwatchModel.empty();
    bestLap = -1;
    worstLap = -1;
    _totalMilliseconds = 0;
    _initialMilliseconds = 0;
    notifyListeners();
  }

  Future<List<SavedStopwatch>> getSavedStopwatches() => _stopwatchService.getSavedStopwatches();

  void loadSavedStopwatch(SavedStopwatch savedStopwatch) {
    stopwatchModel = savedStopwatch.stopwatchModel;
    bestLap = savedStopwatch.bestLap;
    worstLap = savedStopwatch.worstLap;
    tab = 0;
    _initialMilliseconds = stopwatchModel.mainTimer.totalMilliseconds;
    _timerController.add(_initialMilliseconds);
    notifyListeners();
  }

  void getLap() {
    final milliseconds = _totalMilliseconds;
    final currentMainTimer = stopwatchModel.mainTimer;
    final partialMilliseconds = milliseconds - currentMainTimer.totalMilliseconds;
    final newMainTimer = currentMainTimer.copyWith(
      totalMilliseconds: milliseconds,
      partialMilliseconds: partialMilliseconds,
    );
    final laps = stopwatchModel.laps.toList();
    laps.add(newMainTimer);

    if (partialMilliseconds < bestLap || bestLap == -1) bestLap = partialMilliseconds;
    if (partialMilliseconds > worstLap) worstLap = partialMilliseconds;

    stopwatchModel = stopwatchModel.copyWith(
      mainTimer: newMainTimer,
      laps: laps,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerController.close();
    super.dispose();
  }
}
