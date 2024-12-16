// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatments_plans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreatmentsPlansModelImpl _$$TreatmentsPlansModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TreatmentsPlansModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      doctor: json['doctor'] as String?,
      instructions: json['instructions'] as String?,
      medicine: json['medicine'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$TreatmentsPlansModelImplToJson(
        _$TreatmentsPlansModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'doctor': instance.doctor,
      'instructions': instance.instructions,
      'medicine': instance.medicine,
      'notes': instance.notes,
    };
