// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicane_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicaneModel _$MedicaneModelFromJson(Map<String, dynamic> json) {
  return _MedicaneModel.fromJson(json);
}

/// @nodoc
mixin _$MedicaneModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this MedicaneModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicaneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicaneModelCopyWith<MedicaneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicaneModelCopyWith<$Res> {
  factory $MedicaneModelCopyWith(
          MedicaneModel value, $Res Function(MedicaneModel) then) =
      _$MedicaneModelCopyWithImpl<$Res, MedicaneModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$MedicaneModelCopyWithImpl<$Res, $Val extends MedicaneModel>
    implements $MedicaneModelCopyWith<$Res> {
  _$MedicaneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicaneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicaneModelImplCopyWith<$Res>
    implements $MedicaneModelCopyWith<$Res> {
  factory _$$MedicaneModelImplCopyWith(
          _$MedicaneModelImpl value, $Res Function(_$MedicaneModelImpl) then) =
      __$$MedicaneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$MedicaneModelImplCopyWithImpl<$Res>
    extends _$MedicaneModelCopyWithImpl<$Res, _$MedicaneModelImpl>
    implements _$$MedicaneModelImplCopyWith<$Res> {
  __$$MedicaneModelImplCopyWithImpl(
      _$MedicaneModelImpl _value, $Res Function(_$MedicaneModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicaneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$MedicaneModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicaneModelImpl implements _MedicaneModel {
  const _$MedicaneModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description});

  factory _$MedicaneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicaneModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'MedicaneModel(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicaneModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of MedicaneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicaneModelImplCopyWith<_$MedicaneModelImpl> get copyWith =>
      __$$MedicaneModelImplCopyWithImpl<_$MedicaneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicaneModelImplToJson(
      this,
    );
  }
}

abstract class _MedicaneModel implements MedicaneModel {
  const factory _MedicaneModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'description') final String? description}) =
      _$MedicaneModelImpl;

  factory _MedicaneModel.fromJson(Map<String, dynamic> json) =
      _$MedicaneModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;

  /// Create a copy of MedicaneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicaneModelImplCopyWith<_$MedicaneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
