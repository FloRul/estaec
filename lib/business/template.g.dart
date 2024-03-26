// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateImpl _$$TemplateImplFromJson(Map<String, dynamic> json) =>
    _$TemplateImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      name: json['name'] as String,
      tags: Map<String, String>.from(json['tags'] as Map),
    );

Map<String, dynamic> _$$TemplateImplToJson(_$TemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'name': instance.name,
      'tags': instance.tags,
    };
