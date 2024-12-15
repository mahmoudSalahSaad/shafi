// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      authorization: json['authorization'] == null
          ? null
          : Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'patient': instance.patient,
      'authorization': instance.authorization,
    };

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      is_active: json['is_active'] as bool?,
      is_phone_verified: json['is_phone_verified'] as bool? ?? false,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'is_active': instance.is_active,
      'is_phone_verified': instance.is_phone_verified,
    };

_$AuthorizationImpl _$$AuthorizationImplFromJson(Map<String, dynamic> json) =>
    _$AuthorizationImpl(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$AuthorizationImplToJson(_$AuthorizationImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
