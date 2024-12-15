// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicane_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicaneModelImpl _$$MedicaneModelImplFromJson(Map<String, dynamic> json) =>
    _$MedicaneModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$MedicaneModelImplToJson(_$MedicaneModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
