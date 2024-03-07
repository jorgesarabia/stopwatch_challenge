// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_stopwatch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedStopwatch _$SavedStopwatchFromJson(Map<String, dynamic> json) {
  return _SavedStopwatch.fromJson(json);
}

/// @nodoc
mixin _$SavedStopwatch {
  StopwatchModel get stopwatchModel => throw _privateConstructorUsedError;
  int get bestLap => throw _privateConstructorUsedError;
  int get worstLap => throw _privateConstructorUsedError;
  DateTime? get savedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedStopwatchCopyWith<SavedStopwatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedStopwatchCopyWith<$Res> {
  factory $SavedStopwatchCopyWith(
          SavedStopwatch value, $Res Function(SavedStopwatch) then) =
      _$SavedStopwatchCopyWithImpl<$Res, SavedStopwatch>;
  @useResult
  $Res call(
      {StopwatchModel stopwatchModel,
      int bestLap,
      int worstLap,
      DateTime? savedAt});

  $StopwatchModelCopyWith<$Res> get stopwatchModel;
}

/// @nodoc
class _$SavedStopwatchCopyWithImpl<$Res, $Val extends SavedStopwatch>
    implements $SavedStopwatchCopyWith<$Res> {
  _$SavedStopwatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopwatchModel = null,
    Object? bestLap = null,
    Object? worstLap = null,
    Object? savedAt = freezed,
  }) {
    return _then(_value.copyWith(
      stopwatchModel: null == stopwatchModel
          ? _value.stopwatchModel
          : stopwatchModel // ignore: cast_nullable_to_non_nullable
              as StopwatchModel,
      bestLap: null == bestLap
          ? _value.bestLap
          : bestLap // ignore: cast_nullable_to_non_nullable
              as int,
      worstLap: null == worstLap
          ? _value.worstLap
          : worstLap // ignore: cast_nullable_to_non_nullable
              as int,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StopwatchModelCopyWith<$Res> get stopwatchModel {
    return $StopwatchModelCopyWith<$Res>(_value.stopwatchModel, (value) {
      return _then(_value.copyWith(stopwatchModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedStopwatchImplCopyWith<$Res>
    implements $SavedStopwatchCopyWith<$Res> {
  factory _$$SavedStopwatchImplCopyWith(_$SavedStopwatchImpl value,
          $Res Function(_$SavedStopwatchImpl) then) =
      __$$SavedStopwatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StopwatchModel stopwatchModel,
      int bestLap,
      int worstLap,
      DateTime? savedAt});

  @override
  $StopwatchModelCopyWith<$Res> get stopwatchModel;
}

/// @nodoc
class __$$SavedStopwatchImplCopyWithImpl<$Res>
    extends _$SavedStopwatchCopyWithImpl<$Res, _$SavedStopwatchImpl>
    implements _$$SavedStopwatchImplCopyWith<$Res> {
  __$$SavedStopwatchImplCopyWithImpl(
      _$SavedStopwatchImpl _value, $Res Function(_$SavedStopwatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopwatchModel = null,
    Object? bestLap = null,
    Object? worstLap = null,
    Object? savedAt = freezed,
  }) {
    return _then(_$SavedStopwatchImpl(
      stopwatchModel: null == stopwatchModel
          ? _value.stopwatchModel
          : stopwatchModel // ignore: cast_nullable_to_non_nullable
              as StopwatchModel,
      bestLap: null == bestLap
          ? _value.bestLap
          : bestLap // ignore: cast_nullable_to_non_nullable
              as int,
      worstLap: null == worstLap
          ? _value.worstLap
          : worstLap // ignore: cast_nullable_to_non_nullable
              as int,
      savedAt: freezed == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedStopwatchImpl implements _SavedStopwatch {
  _$SavedStopwatchImpl(
      {this.stopwatchModel = const StopwatchModel(),
      this.bestLap = -1,
      this.worstLap = -1,
      this.savedAt});

  factory _$SavedStopwatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedStopwatchImplFromJson(json);

  @override
  @JsonKey()
  final StopwatchModel stopwatchModel;
  @override
  @JsonKey()
  final int bestLap;
  @override
  @JsonKey()
  final int worstLap;
  @override
  final DateTime? savedAt;

  @override
  String toString() {
    return 'SavedStopwatch(stopwatchModel: $stopwatchModel, bestLap: $bestLap, worstLap: $worstLap, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedStopwatchImpl &&
            (identical(other.stopwatchModel, stopwatchModel) ||
                other.stopwatchModel == stopwatchModel) &&
            (identical(other.bestLap, bestLap) || other.bestLap == bestLap) &&
            (identical(other.worstLap, worstLap) ||
                other.worstLap == worstLap) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stopwatchModel, bestLap, worstLap, savedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedStopwatchImplCopyWith<_$SavedStopwatchImpl> get copyWith =>
      __$$SavedStopwatchImplCopyWithImpl<_$SavedStopwatchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedStopwatchImplToJson(
      this,
    );
  }
}

abstract class _SavedStopwatch implements SavedStopwatch {
  factory _SavedStopwatch(
      {final StopwatchModel stopwatchModel,
      final int bestLap,
      final int worstLap,
      final DateTime? savedAt}) = _$SavedStopwatchImpl;

  factory _SavedStopwatch.fromJson(Map<String, dynamic> json) =
      _$SavedStopwatchImpl.fromJson;

  @override
  StopwatchModel get stopwatchModel;
  @override
  int get bestLap;
  @override
  int get worstLap;
  @override
  DateTime? get savedAt;
  @override
  @JsonKey(ignore: true)
  _$$SavedStopwatchImplCopyWith<_$SavedStopwatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
