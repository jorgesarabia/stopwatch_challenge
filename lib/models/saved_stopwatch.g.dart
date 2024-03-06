// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_stopwatch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedStopwatchImpl _$$SavedStopwatchImplFromJson(Map<String, dynamic> json) =>
    _$SavedStopwatchImpl(
      stopwatchModel: json['stopwatchModel'] == null
          ? const StopwatchModel()
          : StopwatchModel.fromJson(
              json['stopwatchModel'] as Map<String, dynamic>),
      bestLap: json['bestLap'] as int? ?? -1,
      worstLap: json['worstLap'] as int? ?? -1,
      savedAt: json['savedAt'] == null
          ? null
          : DateTime.parse(json['savedAt'] as String),
    );

Map<String, dynamic> _$$SavedStopwatchImplToJson(
        _$SavedStopwatchImpl instance) =>
    <String, dynamic>{
      'stopwatchModel': instance.stopwatchModel,
      'bestLap': instance.bestLap,
      'worstLap': instance.worstLap,
      'savedAt': instance.savedAt?.toIso8601String(),
    };
