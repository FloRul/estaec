// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_management_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateManagementStateImpl _$$TemplateManagementStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateManagementStateImpl(
      templates: (json['templates'] as List<dynamic>)
          .map((e) => Template.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TemplateManagementStateImplToJson(
        _$TemplateManagementStateImpl instance) =>
    <String, dynamic>{
      'templates': instance.templates,
    };
