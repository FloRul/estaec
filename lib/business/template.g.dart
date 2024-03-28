// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateImpl _$$TemplateImplFromJson(Map<String, dynamic> json) =>
    _$TemplateImpl(
      id: json['id'] as String,
      creationDate: json['creation_date'] as String?,
      text: json['text'] as String,
      templateName: json['template_name'] as String,
      tags: Map<String, String>.from(json['tags'] as Map),
    );

Map<String, dynamic> _$$TemplateImplToJson(_$TemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creation_date': instance.creationDate,
      'text': instance.text,
      'template_name': instance.templateName,
      'tags': instance.tags,
    };
