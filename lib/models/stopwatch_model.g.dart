// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stopwatch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StopwatchModelImpl _$$StopwatchModelImplFromJson(Map<String, dynamic> json) =>
    _$StopwatchModelImpl(
      mainTimer: json['mainTimer'] == null
          ? const TimerModel()
          : TimerModel.fromJson(json['mainTimer'] as Map<String, dynamic>),
      laps: (json['laps'] as List<dynamic>?)
              ?.map((e) => TimerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StopwatchModelImplToJson(
        _$StopwatchModelImpl instance) =>
    <String, dynamic>{
      'mainTimer': instance.mainTimer,
      'laps': instance.laps,
    };
