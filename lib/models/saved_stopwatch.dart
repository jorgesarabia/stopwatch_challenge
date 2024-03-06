import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

part 'saved_stopwatch.freezed.dart';
part 'saved_stopwatch.g.dart';

@freezed
class SavedStopwatch with _$SavedStopwatch {
  factory SavedStopwatch({
    @Default(StopwatchModel()) StopwatchModel stopwatchModel,
    @Default(-1) int bestLap,
    @Default(-1) int worstLap,
    DateTime? savedAt,
  }) = _SavedStopwatch;

  factory SavedStopwatch.fromJson(Map<String, dynamic> json) => _$SavedStopwatchFromJson(json);
}
