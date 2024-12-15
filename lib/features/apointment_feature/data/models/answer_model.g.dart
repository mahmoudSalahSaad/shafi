// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      questionId: (json['questionId'] as num?)?.toInt(),
      title: json['title'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'title': instance.title,
      'answer': instance.answer,
    };
