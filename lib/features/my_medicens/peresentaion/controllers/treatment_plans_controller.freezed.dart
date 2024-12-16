// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment_plans_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TreatmentPlansState {
  List<TreatmentsPlansModel>? get treatmentsPlans =>
      throw _privateConstructorUsedError;

  /// Create a copy of TreatmentPlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentPlansStateCopyWith<TreatmentPlansState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentPlansStateCopyWith<$Res> {
  factory $TreatmentPlansStateCopyWith(
          TreatmentPlansState value, $Res Function(TreatmentPlansState) then) =
      _$TreatmentPlansStateCopyWithImpl<$Res, TreatmentPlansState>;
  @useResult
  $Res call({List<TreatmentsPlansModel>? treatmentsPlans});
}

/// @nodoc
class _$TreatmentPlansStateCopyWithImpl<$Res, $Val extends TreatmentPlansState>
    implements $TreatmentPlansStateCopyWith<$Res> {
  _$TreatmentPlansStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentPlansState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatmentsPlans = freezed,
  }) {
    return _then(_value.copyWith(
      treatmentsPlans: freezed == treatmentsPlans
          ? _value.treatmentsPlans
          : treatmentsPlans // ignore: cast_nullable_to_non_nullable
              as List<TreatmentsPlansModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreatmentPlansStateImplCopyWith<$Res>
    implements $TreatmentPlansStateCopyWith<$Res> {
  factory _$$TreatmentPlansStateImplCopyWith(_$TreatmentPlansStateImpl value,
          $Res Function(_$TreatmentPlansStateImpl) then) =
      __$$TreatmentPlansStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TreatmentsPlansModel>? treatmentsPlans});
}

/// @nodoc
class __$$TreatmentPlansStateImplCopyWithImpl<$Res>
    extends _$TreatmentPlansStateCopyWithImpl<$Res, _$TreatmentPlansStateImpl>
    implements _$$TreatmentPlansStateImplCopyWith<$Res> {
  __$$TreatmentPlansStateImplCopyWithImpl(_$TreatmentPlansStateImpl _value,
      $Res Function(_$TreatmentPlansStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreatmentPlansState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatmentsPlans = freezed,
  }) {
    return _then(_$TreatmentPlansStateImpl(
      treatmentsPlans: freezed == treatmentsPlans
          ? _value._treatmentsPlans
          : treatmentsPlans // ignore: cast_nullable_to_non_nullable
              as List<TreatmentsPlansModel>?,
    ));
  }
}

/// @nodoc

class _$TreatmentPlansStateImpl implements _TreatmentPlansState {
  const _$TreatmentPlansStateImpl(
      {final List<TreatmentsPlansModel>? treatmentsPlans = const []})
      : _treatmentsPlans = treatmentsPlans;

  final List<TreatmentsPlansModel>? _treatmentsPlans;
  @override
  @JsonKey()
  List<TreatmentsPlansModel>? get treatmentsPlans {
    final value = _treatmentsPlans;
    if (value == null) return null;
    if (_treatmentsPlans is EqualUnmodifiableListView) return _treatmentsPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TreatmentPlansState(treatmentsPlans: $treatmentsPlans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentPlansStateImpl &&
            const DeepCollectionEquality()
                .equals(other._treatmentsPlans, _treatmentsPlans));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_treatmentsPlans));

  /// Create a copy of TreatmentPlansState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentPlansStateImplCopyWith<_$TreatmentPlansStateImpl> get copyWith =>
      __$$TreatmentPlansStateImplCopyWithImpl<_$TreatmentPlansStateImpl>(
          this, _$identity);
}

abstract class _TreatmentPlansState implements TreatmentPlansState {
  const factory _TreatmentPlansState(
          {final List<TreatmentsPlansModel>? treatmentsPlans}) =
      _$TreatmentPlansStateImpl;

  @override
  List<TreatmentsPlansModel>? get treatmentsPlans;

  /// Create a copy of TreatmentPlansState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentPlansStateImplCopyWith<_$TreatmentPlansStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
