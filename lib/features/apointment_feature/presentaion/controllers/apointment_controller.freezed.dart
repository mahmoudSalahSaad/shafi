// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apointment_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApointmentState {
  List<dynamic> get apointmentTimes => throw _privateConstructorUsedError;
  String? get selectedApointment => throw _privateConstructorUsedError;
  String? get selectedDate => throw _privateConstructorUsedError;
  DoctorModel? get selectedDoctor => throw _privateConstructorUsedError;
  List<ApointmentModel> get myApointments => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Create a copy of ApointmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApointmentStateCopyWith<ApointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApointmentStateCopyWith<$Res> {
  factory $ApointmentStateCopyWith(
          ApointmentState value, $Res Function(ApointmentState) then) =
      _$ApointmentStateCopyWithImpl<$Res, ApointmentState>;
  @useResult
  $Res call(
      {List<dynamic> apointmentTimes,
      String? selectedApointment,
      String? selectedDate,
      DoctorModel? selectedDoctor,
      List<ApointmentModel> myApointments,
      String? type});

  $DoctorModelCopyWith<$Res>? get selectedDoctor;
}

/// @nodoc
class _$ApointmentStateCopyWithImpl<$Res, $Val extends ApointmentState>
    implements $ApointmentStateCopyWith<$Res> {
  _$ApointmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApointmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apointmentTimes = null,
    Object? selectedApointment = freezed,
    Object? selectedDate = freezed,
    Object? selectedDoctor = freezed,
    Object? myApointments = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      apointmentTimes: null == apointmentTimes
          ? _value.apointmentTimes
          : apointmentTimes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedApointment: freezed == selectedApointment
          ? _value.selectedApointment
          : selectedApointment // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDoctor: freezed == selectedDoctor
          ? _value.selectedDoctor
          : selectedDoctor // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      myApointments: null == myApointments
          ? _value.myApointments
          : myApointments // ignore: cast_nullable_to_non_nullable
              as List<ApointmentModel>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ApointmentState
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
abstract class _$$ApointmentStateImplCopyWith<$Res>
    implements $ApointmentStateCopyWith<$Res> {
  factory _$$ApointmentStateImplCopyWith(_$ApointmentStateImpl value,
          $Res Function(_$ApointmentStateImpl) then) =
      __$$ApointmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> apointmentTimes,
      String? selectedApointment,
      String? selectedDate,
      DoctorModel? selectedDoctor,
      List<ApointmentModel> myApointments,
      String? type});

  @override
  $DoctorModelCopyWith<$Res>? get selectedDoctor;
}

/// @nodoc
class __$$ApointmentStateImplCopyWithImpl<$Res>
    extends _$ApointmentStateCopyWithImpl<$Res, _$ApointmentStateImpl>
    implements _$$ApointmentStateImplCopyWith<$Res> {
  __$$ApointmentStateImplCopyWithImpl(
      _$ApointmentStateImpl _value, $Res Function(_$ApointmentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApointmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apointmentTimes = null,
    Object? selectedApointment = freezed,
    Object? selectedDate = freezed,
    Object? selectedDoctor = freezed,
    Object? myApointments = null,
    Object? type = freezed,
  }) {
    return _then(_$ApointmentStateImpl(
      apointmentTimes: null == apointmentTimes
          ? _value._apointmentTimes
          : apointmentTimes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedApointment: freezed == selectedApointment
          ? _value.selectedApointment
          : selectedApointment // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDoctor: freezed == selectedDoctor
          ? _value.selectedDoctor
          : selectedDoctor // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      myApointments: null == myApointments
          ? _value._myApointments
          : myApointments // ignore: cast_nullable_to_non_nullable
              as List<ApointmentModel>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApointmentStateImpl implements _ApointmentState {
  _$ApointmentStateImpl(
      {final List<dynamic> apointmentTimes = const [],
      this.selectedApointment,
      this.selectedDate,
      this.selectedDoctor,
      final List<ApointmentModel> myApointments = const [],
      this.type})
      : _apointmentTimes = apointmentTimes,
        _myApointments = myApointments;

  final List<dynamic> _apointmentTimes;
  @override
  @JsonKey()
  List<dynamic> get apointmentTimes {
    if (_apointmentTimes is EqualUnmodifiableListView) return _apointmentTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apointmentTimes);
  }

  @override
  final String? selectedApointment;
  @override
  final String? selectedDate;
  @override
  final DoctorModel? selectedDoctor;
  final List<ApointmentModel> _myApointments;
  @override
  @JsonKey()
  List<ApointmentModel> get myApointments {
    if (_myApointments is EqualUnmodifiableListView) return _myApointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myApointments);
  }

  @override
  final String? type;

  @override
  String toString() {
    return 'ApointmentState(apointmentTimes: $apointmentTimes, selectedApointment: $selectedApointment, selectedDate: $selectedDate, selectedDoctor: $selectedDoctor, myApointments: $myApointments, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApointmentStateImpl &&
            const DeepCollectionEquality()
                .equals(other._apointmentTimes, _apointmentTimes) &&
            (identical(other.selectedApointment, selectedApointment) ||
                other.selectedApointment == selectedApointment) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedDoctor, selectedDoctor) ||
                other.selectedDoctor == selectedDoctor) &&
            const DeepCollectionEquality()
                .equals(other._myApointments, _myApointments) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_apointmentTimes),
      selectedApointment,
      selectedDate,
      selectedDoctor,
      const DeepCollectionEquality().hash(_myApointments),
      type);

  /// Create a copy of ApointmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApointmentStateImplCopyWith<_$ApointmentStateImpl> get copyWith =>
      __$$ApointmentStateImplCopyWithImpl<_$ApointmentStateImpl>(
          this, _$identity);
}

abstract class _ApointmentState implements ApointmentState {
  factory _ApointmentState(
      {final List<dynamic> apointmentTimes,
      final String? selectedApointment,
      final String? selectedDate,
      final DoctorModel? selectedDoctor,
      final List<ApointmentModel> myApointments,
      final String? type}) = _$ApointmentStateImpl;

  @override
  List<dynamic> get apointmentTimes;
  @override
  String? get selectedApointment;
  @override
  String? get selectedDate;
  @override
  DoctorModel? get selectedDoctor;
  @override
  List<ApointmentModel> get myApointments;
  @override
  String? get type;

  /// Create a copy of ApointmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApointmentStateImplCopyWith<_$ApointmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
