// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerModel _$TimerModelFromJson(Map<String, dynamic> json) {
  return _TimerModel.fromJson(json);
}

/// @nodoc
mixin _$TimerModel {
  int get totalMilliseconds => throw _privateConstructorUsedError;
  int get partialMilliseconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerModelCopyWith<TimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerModelCopyWith<$Res> {
  factory $TimerModelCopyWith(
          TimerModel value, $Res Function(TimerModel) then) =
      _$TimerModelCopyWithImpl<$Res, TimerModel>;
  @useResult
  $Res call({int totalMilliseconds, int partialMilliseconds});
}

/// @nodoc
class _$TimerModelCopyWithImpl<$Res, $Val extends TimerModel>
    implements $TimerModelCopyWith<$Res> {
  _$TimerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMilliseconds = null,
    Object? partialMilliseconds = null,
  }) {
    return _then(_value.copyWith(
      totalMilliseconds: null == totalMilliseconds
          ? _value.totalMilliseconds
          : totalMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
      partialMilliseconds: null == partialMilliseconds
          ? _value.partialMilliseconds
          : partialMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerModelImplCopyWith<$Res>
    implements $TimerModelCopyWith<$Res> {
  factory _$$TimerModelImplCopyWith(
          _$TimerModelImpl value, $Res Function(_$TimerModelImpl) then) =
      __$$TimerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalMilliseconds, int partialMilliseconds});
}

/// @nodoc
class __$$TimerModelImplCopyWithImpl<$Res>
    extends _$TimerModelCopyWithImpl<$Res, _$TimerModelImpl>
    implements _$$TimerModelImplCopyWith<$Res> {
  __$$TimerModelImplCopyWithImpl(
      _$TimerModelImpl _value, $Res Function(_$TimerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMilliseconds = null,
    Object? partialMilliseconds = null,
  }) {
    return _then(_$TimerModelImpl(
      totalMilliseconds: null == totalMilliseconds
          ? _value.totalMilliseconds
          : totalMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
      partialMilliseconds: null == partialMilliseconds
          ? _value.partialMilliseconds
          : partialMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerModelImpl implements _TimerModel {
  const _$TimerModelImpl(
      {this.totalMilliseconds = 0, this.partialMilliseconds = 0});

  factory _$TimerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerModelImplFromJson(json);

  @override
  @JsonKey()
  final int totalMilliseconds;
  @override
  @JsonKey()
  final int partialMilliseconds;

  @override
  String toString() {
    return 'TimerModel(totalMilliseconds: $totalMilliseconds, partialMilliseconds: $partialMilliseconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerModelImpl &&
            (identical(other.totalMilliseconds, totalMilliseconds) ||
                other.totalMilliseconds == totalMilliseconds) &&
            (identical(other.partialMilliseconds, partialMilliseconds) ||
                other.partialMilliseconds == partialMilliseconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalMilliseconds, partialMilliseconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerModelImplCopyWith<_$TimerModelImpl> get copyWith =>
      __$$TimerModelImplCopyWithImpl<_$TimerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerModelImplToJson(
      this,
    );
  }
}

abstract class _TimerModel implements TimerModel {
  const factory _TimerModel(
      {final int totalMilliseconds,
      final int partialMilliseconds}) = _$TimerModelImpl;

  factory _TimerModel.fromJson(Map<String, dynamic> json) =
      _$TimerModelImpl.fromJson;

  @override
  int get totalMilliseconds;
  @override
  int get partialMilliseconds;
  @override
  @JsonKey(ignore: true)
  _$$TimerModelImplCopyWith<_$TimerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
