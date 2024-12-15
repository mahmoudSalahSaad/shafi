// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApointmentModel _$ApointmentModelFromJson(Map<String, dynamic> json) {
  return _ApointmentModel.fromJson(json);
}

/// @nodoc
mixin _$ApointmentModel {
  int? get id => throw _privateConstructorUsedError;
  DoctorModel? get doctor => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  CategoryModel? get sub_category => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get start_time => throw _privateConstructorUsedError;
  String? get end_time => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get agora_channel => throw _privateConstructorUsedError;

  /// Serializes this ApointmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApointmentModelCopyWith<ApointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApointmentModelCopyWith<$Res> {
  factory $ApointmentModelCopyWith(
          ApointmentModel value, $Res Function(ApointmentModel) then) =
      _$ApointmentModelCopyWithImpl<$Res, ApointmentModel>;
  @useResult
  $Res call(
      {int? id,
      DoctorModel? doctor,
      CategoryModel? category,
      CategoryModel? sub_category,
      String? date,
      String? start_time,
      String? end_time,
      String? status,
      String? note,
      String? agora_channel});

  $DoctorModelCopyWith<$Res>? get doctor;
  $CategoryModelCopyWith<$Res>? get category;
  $CategoryModelCopyWith<$Res>? get sub_category;
}

/// @nodoc
class _$ApointmentModelCopyWithImpl<$Res, $Val extends ApointmentModel>
    implements $ApointmentModelCopyWith<$Res> {
  _$ApointmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doctor = freezed,
    Object? category = freezed,
    Object? sub_category = freezed,
    Object? date = freezed,
    Object? start_time = freezed,
    Object? end_time = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? agora_channel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      sub_category: freezed == sub_category
          ? _value.sub_category
          : sub_category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      start_time: freezed == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String?,
      end_time: freezed == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      agora_channel: freezed == agora_channel
          ? _value.agora_channel
          : agora_channel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorModelCopyWith<$Res>? get doctor {
    if (_value.doctor == null) {
      return null;
    }

    return $DoctorModelCopyWith<$Res>(_value.doctor!, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get sub_category {
    if (_value.sub_category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.sub_category!, (value) {
      return _then(_value.copyWith(sub_category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApointmentModelImplCopyWith<$Res>
    implements $ApointmentModelCopyWith<$Res> {
  factory _$$ApointmentModelImplCopyWith(_$ApointmentModelImpl value,
          $Res Function(_$ApointmentModelImpl) then) =
      __$$ApointmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DoctorModel? doctor,
      CategoryModel? category,
      CategoryModel? sub_category,
      String? date,
      String? start_time,
      String? end_time,
      String? status,
      String? note,
      String? agora_channel});

  @override
  $DoctorModelCopyWith<$Res>? get doctor;
  @override
  $CategoryModelCopyWith<$Res>? get category;
  @override
  $CategoryModelCopyWith<$Res>? get sub_category;
}

/// @nodoc
class __$$ApointmentModelImplCopyWithImpl<$Res>
    extends _$ApointmentModelCopyWithImpl<$Res, _$ApointmentModelImpl>
    implements _$$ApointmentModelImplCopyWith<$Res> {
  __$$ApointmentModelImplCopyWithImpl(
      _$ApointmentModelImpl _value, $Res Function(_$ApointmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doctor = freezed,
    Object? category = freezed,
    Object? sub_category = freezed,
    Object? date = freezed,
    Object? start_time = freezed,
    Object? end_time = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? agora_channel = freezed,
  }) {
    return _then(_$ApointmentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      sub_category: freezed == sub_category
          ? _value.sub_category
          : sub_category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      start_time: freezed == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as String?,
      end_time: freezed == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      agora_channel: freezed == agora_channel
          ? _value.agora_channel
          : agora_channel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApointmentModelImpl implements _ApointmentModel {
  _$ApointmentModelImpl(
      {this.id,
      this.doctor,
      this.category,
      this.sub_category,
      this.date,
      this.start_time,
      this.end_time,
      this.status,
      this.note,
      this.agora_channel});

  factory _$ApointmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApointmentModelImplFromJson(json);

  @override
  final int? id;
  @override
  final DoctorModel? doctor;
  @override
  final CategoryModel? category;
  @override
  final CategoryModel? sub_category;
  @override
  final String? date;
  @override
  final String? start_time;
  @override
  final String? end_time;
  @override
  final String? status;
  @override
  final String? note;
  @override
  final String? agora_channel;

  @override
  String toString() {
    return 'ApointmentModel(id: $id, doctor: $doctor, category: $category, sub_category: $sub_category, date: $date, start_time: $start_time, end_time: $end_time, status: $status, note: $note, agora_channel: $agora_channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApointmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.sub_category, sub_category) ||
                other.sub_category == sub_category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.start_time, start_time) ||
                other.start_time == start_time) &&
            (identical(other.end_time, end_time) ||
                other.end_time == end_time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.agora_channel, agora_channel) ||
                other.agora_channel == agora_channel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, doctor, category,
      sub_category, date, start_time, end_time, status, note, agora_channel);

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApointmentModelImplCopyWith<_$ApointmentModelImpl> get copyWith =>
      __$$ApointmentModelImplCopyWithImpl<_$ApointmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApointmentModelImplToJson(
      this,
    );
  }
}

abstract class _ApointmentModel implements ApointmentModel {
  factory _ApointmentModel(
      {final int? id,
      final DoctorModel? doctor,
      final CategoryModel? category,
      final CategoryModel? sub_category,
      final String? date,
      final String? start_time,
      final String? end_time,
      final String? status,
      final String? note,
      final String? agora_channel}) = _$ApointmentModelImpl;

  factory _ApointmentModel.fromJson(Map<String, dynamic> json) =
      _$ApointmentModelImpl.fromJson;

  @override
  int? get id;
  @override
  DoctorModel? get doctor;
  @override
  CategoryModel? get category;
  @override
  CategoryModel? get sub_category;
  @override
  String? get date;
  @override
  String? get start_time;
  @override
  String? get end_time;
  @override
  String? get status;
  @override
  String? get note;
  @override
  String? get agora_channel;

  /// Create a copy of ApointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApointmentModelImplCopyWith<_$ApointmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
