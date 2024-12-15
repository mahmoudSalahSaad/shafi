// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctors_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorsState {
  List<DoctorModel> get doctors => throw _privateConstructorUsedError;
  DoctorModel? get selectedDoctor => throw _privateConstructorUsedError;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorsStateCopyWith<DoctorsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorsStateCopyWith<$Res> {
  factory $DoctorsStateCopyWith(
          DoctorsState value, $Res Function(DoctorsState) then) =
      _$DoctorsStateCopyWithImpl<$Res, DoctorsState>;
  @useResult
  $Res call({List<DoctorModel> doctors, DoctorModel? selectedDoctor});

  $DoctorModelCopyWith<$Res>? get selectedDoctor;
}

/// @nodoc
class _$DoctorsStateCopyWithImpl<$Res, $Val extends DoctorsState>
    implements $DoctorsStateCopyWith<$Res> {
  _$DoctorsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? selectedDoctor = freezed,
  }) {
    return _then(_value.copyWith(
      doctors: null == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorModel>,
      selectedDoctor: freezed == selectedDoctor
          ? _value.selectedDoctor
          : selectedDoctor // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
    ) as $Val);
  }

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorModelCopyWith<$Res>? get selectedDoctor {
    if (_value.selectedDoctor == null) {
      return null;
    }

    return $DoctorModelCopyWith<$Res>(_value.selectedDoctor!, (value) {
      return _then(_value.copyWith(selectedDoctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorsStateImplCopyWith<$Res>
    implements $DoctorsStateCopyWith<$Res> {
  factory _$$DoctorsStateImplCopyWith(
          _$DoctorsStateImpl value, $Res Function(_$DoctorsStateImpl) then) =
      __$$DoctorsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DoctorModel> doctors, DoctorModel? selectedDoctor});

  @override
  $DoctorModelCopyWith<$Res>? get selectedDoctor;
}

/// @nodoc
class __$$DoctorsStateImplCopyWithImpl<$Res>
    extends _$DoctorsStateCopyWithImpl<$Res, _$DoctorsStateImpl>
    implements _$$DoctorsStateImplCopyWith<$Res> {
  __$$DoctorsStateImplCopyWithImpl(
      _$DoctorsStateImpl _value, $Res Function(_$DoctorsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = null,
    Object? selectedDoctor = freezed,
  }) {
    return _then(_$DoctorsStateImpl(
      doctors: null == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<DoctorModel>,
      selectedDoctor: freezed == selectedDoctor
          ? _value.selectedDoctor
          : selectedDoctor // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
    ));
  }
}

/// @nodoc

class _$DoctorsStateImpl implements _DoctorsState {
  _$DoctorsStateImpl(
      {final List<DoctorModel> doctors = const [], this.selectedDoctor})
      : _doctors = doctors;

  final List<DoctorModel> _doctors;
  @override
  @JsonKey()
  List<DoctorModel> get doctors {
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  final DoctorModel? selectedDoctor;

  @override
  String toString() {
    return 'DoctorsState(doctors: $doctors, selectedDoctor: $selectedDoctor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorsStateImpl &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.selectedDoctor, selectedDoctor) ||
                other.selectedDoctor == selectedDoctor));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_doctors), selectedDoctor);

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorsStateImplCopyWith<_$DoctorsStateImpl> get copyWith =>
      __$$DoctorsStateImplCopyWithImpl<_$DoctorsStateImpl>(this, _$identity);
}

abstract class _DoctorsState implements DoctorsState {
  factory _DoctorsState(
      {final List<DoctorModel> doctors,
      final DoctorModel? selectedDoctor}) = _$DoctorsStateImpl;

  @override
  List<DoctorModel> get doctors;
  @override
  DoctorModel? get selectedDoctor;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorsStateImplCopyWith<_$DoctorsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
