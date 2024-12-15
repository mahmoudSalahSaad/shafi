// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_apointment_dates_controllers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetApointmentDatesState {
  List<String> get dates => throw _privateConstructorUsedError;

  /// Create a copy of GetApointmentDatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetApointmentDatesStateCopyWith<GetApointmentDatesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetApointmentDatesStateCopyWith<$Res> {
  factory $GetApointmentDatesStateCopyWith(GetApointmentDatesState value,
          $Res Function(GetApointmentDatesState) then) =
      _$GetApointmentDatesStateCopyWithImpl<$Res, GetApointmentDatesState>;
  @useResult
  $Res call({List<String> dates});
}

/// @nodoc
class _$GetApointmentDatesStateCopyWithImpl<$Res,
        $Val extends GetApointmentDatesState>
    implements $GetApointmentDatesStateCopyWith<$Res> {
  _$GetApointmentDatesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetApointmentDatesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dates = null,
  }) {
    return _then(_value.copyWith(
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetApointmentDatesStateImplCopyWith<$Res>
    implements $GetApointmentDatesStateCopyWith<$Res> {
  factory _$$GetApointmentDatesStateImplCopyWith(
          _$GetApointmentDatesStateImpl value,
          $Res Function(_$GetApointmentDatesStateImpl) then) =
      __$$GetApointmentDatesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> dates});
}

/// @nodoc
class __$$GetApointmentDatesStateImplCopyWithImpl<$Res>
    extends _$GetApointmentDatesStateCopyWithImpl<$Res,
        _$GetApointmentDatesStateImpl>
    implements _$$GetApointmentDatesStateImplCopyWith<$Res> {
  __$$GetApointmentDatesStateImplCopyWithImpl(
      _$GetApointmentDatesStateImpl _value,
      $Res Function(_$GetApointmentDatesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetApointmentDatesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dates = null,
  }) {
    return _then(_$GetApointmentDatesStateImpl(
      dates: null == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$GetApointmentDatesStateImpl implements _GetApointmentDatesState {
  _$GetApointmentDatesStateImpl({final List<String> dates = const []})
      : _dates = dates;

  final List<String> _dates;
  @override
  @JsonKey()
  List<String> get dates {
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dates);
  }

  @override
  String toString() {
    return 'GetApointmentDatesState(dates: $dates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetApointmentDatesStateImpl &&
            const DeepCollectionEquality().equals(other._dates, _dates));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dates));

  /// Create a copy of GetApointmentDatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetApointmentDatesStateImplCopyWith<_$GetApointmentDatesStateImpl>
      get copyWith => __$$GetApointmentDatesStateImplCopyWithImpl<
          _$GetApointmentDatesStateImpl>(this, _$identity);
}

abstract class _GetApointmentDatesState implements GetApointmentDatesState {
  factory _GetApointmentDatesState({final List<String> dates}) =
      _$GetApointmentDatesStateImpl;

  @override
  List<String> get dates;

  /// Create a copy of GetApointmentDatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetApointmentDatesStateImplCopyWith<_$GetApointmentDatesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
