// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return _AnswerModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerModel {
  int? get questionId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  /// Serializes this AnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerModelCopyWith<AnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerModelCopyWith<$Res> {
  factory $AnswerModelCopyWith(
          AnswerModel value, $Res Function(AnswerModel) then) =
      _$AnswerModelCopyWithImpl<$Res, AnswerModel>;
  @useResult
  $Res call({int? questionId, String? title, String? answer});
}

/// @nodoc
class _$AnswerModelCopyWithImpl<$Res, $Val extends AnswerModel>
    implements $AnswerModelCopyWith<$Res> {
  _$AnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? title = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerModelImplCopyWith<$Res>
    implements $AnswerModelCopyWith<$Res> {
  factory _$$AnswerModelImplCopyWith(
          _$AnswerModelImpl value, $Res Function(_$AnswerModelImpl) then) =
      __$$AnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? questionId, String? title, String? answer});
}

/// @nodoc
class __$$AnswerModelImplCopyWithImpl<$Res>
    extends _$AnswerModelCopyWithImpl<$Res, _$AnswerModelImpl>
    implements _$$AnswerModelImplCopyWith<$Res> {
  __$$AnswerModelImplCopyWithImpl(
      _$AnswerModelImpl _value, $Res Function(_$AnswerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? title = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$AnswerModelImpl(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerModelImpl implements _AnswerModel {
  _$AnswerModelImpl({this.questionId, this.title, this.answer});

  factory _$AnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerModelImplFromJson(json);

  @override
  final int? questionId;
  @override
  final String? title;
  @override
  final String? answer;

  @override
  String toString() {
    return 'AnswerModel(questionId: $questionId, title: $title, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerModelImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, title, answer);

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      __$$AnswerModelImplCopyWithImpl<_$AnswerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerModelImplToJson(
      this,
    );
  }
}

abstract class _AnswerModel implements AnswerModel {
  factory _AnswerModel(
      {final int? questionId,
      final String? title,
      final String? answer}) = _$AnswerModelImpl;

  factory _AnswerModel.fromJson(Map<String, dynamic> json) =
      _$AnswerModelImpl.fromJson;

  @override
  int? get questionId;
  @override
  String? get title;
  @override
  String? get answer;

  /// Create a copy of AnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerModelImplCopyWith<_$AnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
