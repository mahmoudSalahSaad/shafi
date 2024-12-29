// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacyModel _$PrivacyModelFromJson(Map<String, dynamic> json) {
  return _PrivacyModel.fromJson(json);
}

/// @nodoc
mixin _$PrivacyModel {
  String? get slug => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this PrivacyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyModelCopyWith<PrivacyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyModelCopyWith<$Res> {
  factory $PrivacyModelCopyWith(
          PrivacyModel value, $Res Function(PrivacyModel) then) =
      _$PrivacyModelCopyWithImpl<$Res, PrivacyModel>;
  @useResult
  $Res call({String? slug, String? title, String? content, String? image});
}

/// @nodoc
class _$PrivacyModelCopyWithImpl<$Res, $Val extends PrivacyModel>
    implements $PrivacyModelCopyWith<$Res> {
  _$PrivacyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyModelImplCopyWith<$Res>
    implements $PrivacyModelCopyWith<$Res> {
  factory _$$PrivacyModelImplCopyWith(
          _$PrivacyModelImpl value, $Res Function(_$PrivacyModelImpl) then) =
      __$$PrivacyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? slug, String? title, String? content, String? image});
}

/// @nodoc
class __$$PrivacyModelImplCopyWithImpl<$Res>
    extends _$PrivacyModelCopyWithImpl<$Res, _$PrivacyModelImpl>
    implements _$$PrivacyModelImplCopyWith<$Res> {
  __$$PrivacyModelImplCopyWithImpl(
      _$PrivacyModelImpl _value, $Res Function(_$PrivacyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? image = freezed,
  }) {
    return _then(_$PrivacyModelImpl(
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyModelImpl implements _PrivacyModel {
  _$PrivacyModelImpl({this.slug, this.title, this.content, this.image});

  factory _$PrivacyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyModelImplFromJson(json);

  @override
  final String? slug;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? image;

  @override
  String toString() {
    return 'PrivacyModel(slug: $slug, title: $title, content: $content, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyModelImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slug, title, content, image);

  /// Create a copy of PrivacyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyModelImplCopyWith<_$PrivacyModelImpl> get copyWith =>
      __$$PrivacyModelImplCopyWithImpl<_$PrivacyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyModelImplToJson(
      this,
    );
  }
}

abstract class _PrivacyModel implements PrivacyModel {
  factory _PrivacyModel(
      {final String? slug,
      final String? title,
      final String? content,
      final String? image}) = _$PrivacyModelImpl;

  factory _PrivacyModel.fromJson(Map<String, dynamic> json) =
      _$PrivacyModelImpl.fromJson;

  @override
  String? get slug;
  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get image;

  /// Create a copy of PrivacyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyModelImplCopyWith<_$PrivacyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
