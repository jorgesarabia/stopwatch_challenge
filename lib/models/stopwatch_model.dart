import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stopwatch_challenge/models/timer_model.dart';

part 'stopwatch_model.freezed.dart';
part 'stopwatch_model.g.dart';

@freezed
class StopwatchModel with _$StopwatchModel {
  factory StopwatchModel({
    @Default(TimerModel()) TimerModel mainTimer,
    @Default([]) List<TimerModel> laps,
  }) = _StopwatchModel;

  factory StopwatchModel.empty() => StopwatchModel();

  factory StopwatchModel.fromJson(Map<String, dynamic> json) => _$StopwatchModelFromJson(json);
}
