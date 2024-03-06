import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

enum StopwatchState { zero, isRunning, isStopped }

@injectable
class StopwatchController extends ChangeNotifier {
  StopwatchController(this._stopwatchModel) {
    _timer = Timer.periodic(const Duration(milliseconds: 1), _onTimerTick);
    _stopwatch = Stopwatch();
  }

  late final Timer _timer;
  late final Stopwatch _stopwatch;
  final StopwatchModel _stopwatchModel;

  final _timerController = StreamController<int>();
  Stream<int> get timerStream => _timerController.stream;

  StopwatchState get stopwatchState {
    if (_stopwatch.isRunning) return StopwatchState.isRunning;
    if (_stopwatch.elapsedMicroseconds == 0) return StopwatchState.zero;
    return StopwatchState.isStopped;
  }

  bool get isZero => stopwatchState == StopwatchState.zero;
  bool get isRuning => stopwatchState == StopwatchState.isRunning;
  bool get isStopped => stopwatchState == StopwatchState.isStopped;

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
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerController.close();
    super.dispose();
  }
}
