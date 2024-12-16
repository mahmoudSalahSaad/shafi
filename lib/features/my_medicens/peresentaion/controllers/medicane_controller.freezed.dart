// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicane_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MedicaneState {
  List<MedicaneModel>? get medicanes => throw _privateConstructorUsedError;

  /// Create a copy of MedicaneState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicaneStateCopyWith<MedicaneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicaneStateCopyWith<$Res> {
  factory $MedicaneStateCopyWith(
          MedicaneState value, $Res Function(MedicaneState) then) =
      _$MedicaneStateCopyWithImpl<$Res, MedicaneState>;
  @useResult
  $Res call({List<MedicaneModel>? medicanes});
}

/// @nodoc
class _$MedicaneStateCopyWithImpl<$Res, $Val extends MedicaneState>
    implements $MedicaneStateCopyWith<$Res> {
  _$MedicaneStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicaneState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicanes = freezed,
  }) {
    return _then(_value.copyWith(
      medicanes: freezed == medicanes
          ? _value.medicanes
          : medicanes // ignore: cast_nullable_to_non_nullable
              as List<MedicaneModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicaneStateImplCopyWith<$Res>
    implements $MedicaneStateCopyWith<$Res> {
  factory _$$MedicaneStateImplCopyWith(
          _$MedicaneStateImpl value, $Res Function(_$MedicaneStateImpl) then) =
      __$$MedicaneStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MedicaneModel>? medicanes});
}

/// @nodoc
class __$$MedicaneStateImplCopyWithImpl<$Res>
    extends _$MedicaneStateCopyWithImpl<$Res, _$MedicaneStateImpl>
    implements _$$MedicaneStateImplCopyWith<$Res> {
  __$$MedicaneStateImplCopyWithImpl(
      _$MedicaneStateImpl _value, $Res Function(_$MedicaneStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicaneState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicanes = freezed,
  }) {
    return _then(_$MedicaneStateImpl(
      medicanes: freezed == medicanes
          ? _value._medicanes
          : medicanes // ignore: cast_nullable_to_non_nullable
              as List<MedicaneModel>?,
    ));
  }
}

/// @nodoc

class _$MedicaneStateImpl implements _MedicaneState {
  _$MedicaneStateImpl({final List<MedicaneModel>? medicanes = const []})
      : _medicanes = medicanes;

  final List<MedicaneModel>? _medicanes;
  @override
  @JsonKey()
  List<MedicaneModel>? get medicanes {
    final value = _medicanes;
    if (value == null) return null;
    if (_medicanes is EqualUnmodifiableListView) return _medicanes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MedicaneState(medicanes: $medicanes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicaneStateImpl &&
            const DeepCollectionEquality()
                .equals(other._medicanes, _medicanes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_medicanes));

  /// Create a copy of MedicaneState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicaneStateImplCopyWith<_$MedicaneStateImpl> get copyWith =>
      __$$MedicaneStateImplCopyWithImpl<_$MedicaneStateImpl>(this, _$identity);
}

abstract class _MedicaneState implements MedicaneState {
  factory _MedicaneState({final List<MedicaneModel>? medicanes}) =
      _$MedicaneStateImpl;

  @override
  List<MedicaneModel>? get medicanes;

  /// Create a copy of MedicaneState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicaneStateImplCopyWith<_$MedicaneStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
