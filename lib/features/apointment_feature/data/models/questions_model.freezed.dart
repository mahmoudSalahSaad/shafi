// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) {
  return _QuestionsModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<Options>? get options => throw _privateConstructorUsedError;

  /// Serializes this QuestionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionsModelCopyWith<QuestionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsModelCopyWith<$Res> {
  factory $QuestionsModelCopyWith(
          QuestionsModel value, $Res Function(QuestionsModel) then) =
      _$QuestionsModelCopyWithImpl<$Res, QuestionsModel>;
  @useResult
  $Res call({int? id, String? question, String? type, List<Options>? options});
}

/// @nodoc
class _$QuestionsModelCopyWithImpl<$Res, $Val extends QuestionsModel>
    implements $QuestionsModelCopyWith<$Res> {
  _$QuestionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? type = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Options>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionsModelImplCopyWith<$Res>
    implements $QuestionsModelCopyWith<$Res> {
  factory _$$QuestionsModelImplCopyWith(_$QuestionsModelImpl value,
          $Res Function(_$QuestionsModelImpl) then) =
      __$$QuestionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? question, String? type, List<Options>? options});
}

/// @nodoc
class __$$QuestionsModelImplCopyWithImpl<$Res>
    extends _$QuestionsModelCopyWithImpl<$Res, _$QuestionsModelImpl>
    implements _$$QuestionsModelImplCopyWith<$Res> {
  __$$QuestionsModelImplCopyWithImpl(
      _$QuestionsModelImpl _value, $Res Function(_$QuestionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? type = freezed,
    Object? options = freezed,
  }) {
    return _then(_$QuestionsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Options>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionsModelImpl implements _QuestionsModel {
  _$QuestionsModelImpl(
      {this.id, this.question, this.type, final List<Options>? options})
      : _options = options;

  factory _$QuestionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionsModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? question;
  @override
  final String? type;
  final List<Options>? _options;
  @override
  List<Options>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuestionsModel(id: $id, question: $question, type: $type, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, type,
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of QuestionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionsModelImplCopyWith<_$QuestionsModelImpl> get copyWith =>
      __$$QuestionsModelImplCopyWithImpl<_$QuestionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionsModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionsModel implements QuestionsModel {
  factory _QuestionsModel(
      {final int? id,
      final String? question,
      final String? type,
      final List<Options>? options}) = _$QuestionsModelImpl;

  factory _QuestionsModel.fromJson(Map<String, dynamic> json) =
      _$QuestionsModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get question;
  @override
  String? get type;
  @override
  List<Options>? get options;

  /// Create a copy of QuestionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionsModelImplCopyWith<_$QuestionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return _Options.fromJson(json);
}

/// @nodoc
mixin _$Options {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this Options to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionsCopyWith<Options> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionsCopyWith<$Res> {
  factory $OptionsCopyWith(Options value, $Res Function(Options) then) =
      _$OptionsCopyWithImpl<$Res, Options>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$OptionsCopyWithImpl<$Res, $Val extends Options>
    implements $OptionsCopyWith<$Res> {
  _$OptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionsImplCopyWith<$Res> implements $OptionsCopyWith<$Res> {
  factory _$$OptionsImplCopyWith(
          _$OptionsImpl value, $Res Function(_$OptionsImpl) then) =
      __$$OptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$OptionsImplCopyWithImpl<$Res>
    extends _$OptionsCopyWithImpl<$Res, _$OptionsImpl>
    implements _$$OptionsImplCopyWith<$Res> {
  __$$OptionsImplCopyWithImpl(
      _$OptionsImpl _value, $Res Function(_$OptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$OptionsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionsImpl implements _Options {
  _$OptionsImpl({this.id, this.name});

  factory _$OptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionsImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Options(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionsImplCopyWith<_$OptionsImpl> get copyWith =>
      __$$OptionsImplCopyWithImpl<_$OptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionsImplToJson(
      this,
    );
  }
}

abstract class _Options implements Options {
  factory _Options({final int? id, final String? name}) = _$OptionsImpl;

  factory _Options.fromJson(Map<String, dynamic> json) = _$OptionsImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of Options
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionsImplCopyWith<_$OptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
