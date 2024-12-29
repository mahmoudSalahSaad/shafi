// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrivacyState {
  PrivacyModel? get privacy => throw _privateConstructorUsedError;

  /// Create a copy of PrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyStateCopyWith<PrivacyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyStateCopyWith<$Res> {
  factory $PrivacyStateCopyWith(
          PrivacyState value, $Res Function(PrivacyState) then) =
      _$PrivacyStateCopyWithImpl<$Res, PrivacyState>;
  @useResult
  $Res call({PrivacyModel? privacy});

  $PrivacyModelCopyWith<$Res>? get privacy;
}

/// @nodoc
class _$PrivacyStateCopyWithImpl<$Res, $Val extends PrivacyState>
    implements $PrivacyStateCopyWith<$Res> {
  _$PrivacyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = freezed,
  }) {
    return _then(_value.copyWith(
      privacy: freezed == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyModel?,
    ) as $Val);
  }

  /// Create a copy of PrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacyModelCopyWith<$Res>? get privacy {
    if (_value.privacy == null) {
      return null;
    }

    return $PrivacyModelCopyWith<$Res>(_value.privacy!, (value) {
      return _then(_value.copyWith(privacy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrivacyStateImplCopyWith<$Res>
    implements $PrivacyStateCopyWith<$Res> {
  factory _$$PrivacyStateImplCopyWith(
          _$PrivacyStateImpl value, $Res Function(_$PrivacyStateImpl) then) =
      __$$PrivacyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PrivacyModel? privacy});

  @override
  $PrivacyModelCopyWith<$Res>? get privacy;
}

/// @nodoc
class __$$PrivacyStateImplCopyWithImpl<$Res>
    extends _$PrivacyStateCopyWithImpl<$Res, _$PrivacyStateImpl>
    implements _$$PrivacyStateImplCopyWith<$Res> {
  __$$PrivacyStateImplCopyWithImpl(
      _$PrivacyStateImpl _value, $Res Function(_$PrivacyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = freezed,
  }) {
    return _then(_$PrivacyStateImpl(
      privacy: freezed == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacyModel?,
    ));
  }
}

/// @nodoc

class _$PrivacyStateImpl implements _PrivacyState {
  _$PrivacyStateImpl({this.privacy});

  @override
  final PrivacyModel? privacy;

  @override
  String toString() {
    return 'PrivacyState(privacy: $privacy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyStateImpl &&
            (identical(other.privacy, privacy) || other.privacy == privacy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, privacy);

  /// Create a copy of PrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyStateImplCopyWith<_$PrivacyStateImpl> get copyWith =>
      __$$PrivacyStateImplCopyWithImpl<_$PrivacyStateImpl>(this, _$identity);
}

abstract class _PrivacyState implements PrivacyState {
  factory _PrivacyState({final PrivacyModel? privacy}) = _$PrivacyStateImpl;

  @override
  PrivacyModel? get privacy;

  /// Create a copy of PrivacyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyStateImplCopyWith<_$PrivacyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
