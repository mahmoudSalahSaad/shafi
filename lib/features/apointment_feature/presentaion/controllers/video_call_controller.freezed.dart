// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_call_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoCallState {
  String? get token => throw _privateConstructorUsedError;

  /// Create a copy of VideoCallState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoCallStateCopyWith<VideoCallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallStateCopyWith<$Res> {
  factory $VideoCallStateCopyWith(
          VideoCallState value, $Res Function(VideoCallState) then) =
      _$VideoCallStateCopyWithImpl<$Res, VideoCallState>;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class _$VideoCallStateCopyWithImpl<$Res, $Val extends VideoCallState>
    implements $VideoCallStateCopyWith<$Res> {
  _$VideoCallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoCallState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoCallStateImplCopyWith<$Res>
    implements $VideoCallStateCopyWith<$Res> {
  factory _$$VideoCallStateImplCopyWith(_$VideoCallStateImpl value,
          $Res Function(_$VideoCallStateImpl) then) =
      __$$VideoCallStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$$VideoCallStateImplCopyWithImpl<$Res>
    extends _$VideoCallStateCopyWithImpl<$Res, _$VideoCallStateImpl>
    implements _$$VideoCallStateImplCopyWith<$Res> {
  __$$VideoCallStateImplCopyWithImpl(
      _$VideoCallStateImpl _value, $Res Function(_$VideoCallStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoCallState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$VideoCallStateImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VideoCallStateImpl implements _VideoCallState {
  _$VideoCallStateImpl({this.token});

  @override
  final String? token;

  @override
  String toString() {
    return 'VideoCallState(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoCallStateImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of VideoCallState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoCallStateImplCopyWith<_$VideoCallStateImpl> get copyWith =>
      __$$VideoCallStateImplCopyWithImpl<_$VideoCallStateImpl>(
          this, _$identity);
}

abstract class _VideoCallState implements VideoCallState {
  factory _VideoCallState({final String? token}) = _$VideoCallStateImpl;

  @override
  String? get token;

  /// Create a copy of VideoCallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoCallStateImplCopyWith<_$VideoCallStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
