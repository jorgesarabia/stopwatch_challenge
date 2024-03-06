// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerModelImpl _$$TimerModelImplFromJson(Map<String, dynamic> json) =>
    _$TimerModelImpl(
      totalMilliseconds: json['totalMilliseconds'] as int? ?? 0,
      partialMilliseconds: json['partialMilliseconds'] as int? ?? 0,
    );

Map<String, dynamic> _$$TimerModelImplToJson(_$TimerModelImpl instance) =>
    <String, dynamic>{
      'totalMilliseconds': instance.totalMilliseconds,
      'partialMilliseconds': instance.partialMilliseconds,
    };
