// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionsModelImpl _$$QuestionsModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionsModelImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      type: json['type'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionsModelImplToJson(
        _$QuestionsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'type': instance.type,
      'options': instance.options,
    };

_$OptionsImpl _$$OptionsImplFromJson(Map<String, dynamic> json) =>
    _$OptionsImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      children: json['children'] == null
          ? null
          : Children.fromJson(json['children'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OptionsImplToJson(_$OptionsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'children': instance.children,
    };

_$ChildrenImpl _$$ChildrenImplFromJson(Map<String, dynamic> json) =>
    _$ChildrenImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$ChildrenImplToJson(_$ChildrenImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'type': instance.type,
    };
