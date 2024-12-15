// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_call_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoCallModel _$VideoCallModelFromJson(Map<String, dynamic> json) {
  return _VideoCallModel.fromJson(json);
}

/// @nodoc
mixin _$VideoCallModel {
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this VideoCallModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoCallModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoCallModelCopyWith<VideoCallModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallModelCopyWith<$Res> {
  factory $VideoCallModelCopyWith(
          VideoCallModel value, $Res Function(VideoCallModel) then) =
      _$VideoCallModelCopyWithImpl<$Res, VideoCallModel>;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class _$VideoCallModelCopyWithImpl<$Res, $Val extends VideoCallModel>
    implements $VideoCallModelCopyWith<$Res> {
  _$VideoCallModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoCallModel
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
abstract class _$$VideoCallModelImplCopyWith<$Res>
    implements $VideoCallModelCopyWith<$Res> {
  factory _$$VideoCallModelImplCopyWith(_$VideoCallModelImpl value,
          $Res Function(_$VideoCallModelImpl) then) =
      __$$VideoCallModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$$VideoCallModelImplCopyWithImpl<$Res>
    extends _$VideoCallModelCopyWithImpl<$Res, _$VideoCallModelImpl>
    implements _$$VideoCallModelImplCopyWith<$Res> {
  __$$VideoCallModelImplCopyWithImpl(
      _$VideoCallModelImpl _value, $Res Function(_$VideoCallModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoCallModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$VideoCallModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoCallModelImpl implements _VideoCallModel {
  _$VideoCallModelImpl({this.token});

  factory _$VideoCallModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoCallModelImplFromJson(json);

  @override
  final String? token;

  @override
  String toString() {
    return 'VideoCallModel(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoCallModelImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of VideoCallModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoCallModelImplCopyWith<_$VideoCallModelImpl> get copyWith =>
      __$$VideoCallModelImplCopyWithImpl<_$VideoCallModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoCallModelImplToJson(
      this,
    );
  }
}

abstract class _VideoCallModel implements VideoCallModel {
  factory _VideoCallModel({final String? token}) = _$VideoCallModelImpl;

  factory _VideoCallModel.fromJson(Map<String, dynamic> json) =
      _$VideoCallModelImpl.fromJson;

  @override
  String? get token;

  /// Create a copy of VideoCallModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoCallModelImplCopyWith<_$VideoCallModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
