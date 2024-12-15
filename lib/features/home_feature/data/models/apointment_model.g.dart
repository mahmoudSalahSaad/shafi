// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApointmentModelImpl _$$ApointmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApointmentModelImpl(
      id: (json['id'] as num?)?.toInt(),
      doctor: json['doctor'] == null
          ? null
          : DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      sub_category: json['sub_category'] == null
          ? null
          : CategoryModel.fromJson(
              json['sub_category'] as Map<String, dynamic>),
      date: json['date'] as String?,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
      status: json['status'] as String?,
      note: json['note'] as String?,
      agora_channel: json['agora_channel'] as String?,
    );

Map<String, dynamic> _$$ApointmentModelImplToJson(
        _$ApointmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'category': instance.category,
      'sub_category': instance.sub_category,
      'date': instance.date,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'status': instance.status,
      'note': instance.note,
      'agora_channel': instance.agora_channel,
    };
