// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stopwatch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StopwatchModel _$StopwatchModelFromJson(Map<String, dynamic> json) {
  return _StopwatchModel.fromJson(json);
}

/// @nodoc
mixin _$StopwatchModel {
  TimerModel get mainTimer => throw _privateConstructorUsedError;
  List<TimerModel> get laps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopwatchModelCopyWith<StopwatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopwatchModelCopyWith<$Res> {
  factory $StopwatchModelCopyWith(
          StopwatchModel value, $Res Function(StopwatchModel) then) =
      _$StopwatchModelCopyWithImpl<$Res, StopwatchModel>;
  @useResult
  $Res call({TimerModel mainTimer, List<TimerModel> laps});

  $TimerModelCopyWith<$Res> get mainTimer;
}

/// @nodoc
class _$StopwatchModelCopyWithImpl<$Res, $Val extends StopwatchModel>
    implements $StopwatchModelCopyWith<$Res> {
  _$StopwatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainTimer = null,
    Object? laps = null,
  }) {
    return _then(_value.copyWith(
      mainTimer: null == mainTimer
          ? _value.mainTimer
          : mainTimer // ignore: cast_nullable_to_non_nullable
              as TimerModel,
      laps: null == laps
          ? _value.laps
          : laps // ignore: cast_nullable_to_non_nullable
              as List<TimerModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerModelCopyWith<$Res> get mainTimer {
    return $TimerModelCopyWith<$Res>(_value.mainTimer, (value) {
      return _then(_value.copyWith(mainTimer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StopwatchModelImplCopyWith<$Res>
    implements $StopwatchModelCopyWith<$Res> {
  factory _$$StopwatchModelImplCopyWith(_$StopwatchModelImpl value,
          $Res Function(_$StopwatchModelImpl) then) =
      __$$StopwatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimerModel mainTimer, List<TimerModel> laps});

  @override
  $TimerModelCopyWith<$Res> get mainTimer;
}

/// @nodoc
class __$$StopwatchModelImplCopyWithImpl<$Res>
    extends _$StopwatchModelCopyWithImpl<$Res, _$StopwatchModelImpl>
    implements _$$StopwatchModelImplCopyWith<$Res> {
  __$$StopwatchModelImplCopyWithImpl(
      _$StopwatchModelImpl _value, $Res Function(_$StopwatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainTimer = null,
    Object? laps = null,
  }) {
    return _then(_$StopwatchModelImpl(
      mainTimer: null == mainTimer
          ? _value.mainTimer
          : mainTimer // ignore: cast_nullable_to_non_nullable
              as TimerModel,
      laps: null == laps
          ? _value._laps
          : laps // ignore: cast_nullable_to_non_nullable
              as List<TimerModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StopwatchModelImpl implements _StopwatchModel {
  const _$StopwatchModelImpl(
      {this.mainTimer = const TimerModel(),
      final List<TimerModel> laps = const []})
      : _laps = laps;

  factory _$StopwatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StopwatchModelImplFromJson(json);

  @override
  @JsonKey()
  final TimerModel mainTimer;
  final List<TimerModel> _laps;
  @override
  @JsonKey()
  List<TimerModel> get laps {
    if (_laps is EqualUnmodifiableListView) return _laps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_laps);
  }

  @override
  String toString() {
    return 'StopwatchModel(mainTimer: $mainTimer, laps: $laps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopwatchModelImpl &&
            (identical(other.mainTimer, mainTimer) ||
                other.mainTimer == mainTimer) &&
            const DeepCollectionEquality().equals(other._laps, _laps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, mainTimer, const DeepCollectionEquality().hash(_laps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopwatchModelImplCopyWith<_$StopwatchModelImpl> get copyWith =>
      __$$StopwatchModelImplCopyWithImpl<_$StopwatchModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StopwatchModelImplToJson(
      this,
    );
  }
}

abstract class _StopwatchModel implements StopwatchModel {
  const factory _StopwatchModel(
      {final TimerModel mainTimer,
      final List<TimerModel> laps}) = _$StopwatchModelImpl;

  factory _StopwatchModel.fromJson(Map<String, dynamic> json) =
      _$StopwatchModelImpl.fromJson;

  @override
  TimerModel get mainTimer;
  @override
  List<TimerModel> get laps;
  @override
  @JsonKey(ignore: true)
  _$$StopwatchModelImplCopyWith<_$StopwatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
