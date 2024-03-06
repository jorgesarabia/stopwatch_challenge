import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

@injectable
class StopwatchController extends ChangeNotifier {
  StopwatchController(this.stopwatchModel) {
    _timer = Timer.periodic(const Duration(milliseconds: 1), _onTimerTick);
    _stopwatch = Stopwatch();
  }

  late final Timer _timer;
  late final Stopwatch _stopwatch;
  StopwatchModel stopwatchModel;

  final _timerController = StreamController<int>();
  Stream<int> get timerStream => _timerController.stream;

  bool get isZero => _stopwatch.elapsedMicroseconds == 0;
  bool get isRuning => _stopwatch.isRunning;
  bool get isStopped => !isZero && !isRuning;

  void _onTimerTick(Timer timer) {
    if (_stopwatch.isRunning) {
      _timerController.add(_stopwatch.elapsedMilliseconds);
    }
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
    _stopwatch.reset();
    _timerController.add(0);
    stopwatchModel = StopwatchModel.empty();
    notifyListeners();
  }

  void getLap() {
    final milliseconds = _stopwatch.elapsedMilliseconds;
    final currentMainTimer = stopwatchModel.mainTimer;
    final partialMilliseconds = milliseconds - currentMainTimer.totalMilliseconds;
    final newMainTimer = currentMainTimer.copyWith(
      totalMilliseconds: milliseconds,
      partialMilliseconds: partialMilliseconds,
    );
    final laps = stopwatchModel.laps.toList();
    laps.add(newMainTimer);

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
