// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rag_settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RagSettingsStateImpl _$$RagSettingsStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RagSettingsStateImpl(
      collectionName: json['collectionName'] as String?,
      availableCollections: (json['availableCollections'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sourceType: $enumDecodeNullable(_$SourceTypeEnumMap, json['sourceType']),
    );

Map<String, dynamic> _$$RagSettingsStateImplToJson(
        _$RagSettingsStateImpl instance) =>
    <String, dynamic>{
      'collectionName': instance.collectionName,
      'availableCollections': instance.availableCollections,
      'sourceType': _$SourceTypeEnumMap[instance.sourceType],
    };

const _$SourceTypeEnumMap = {
  SourceType.chat: 'chat',
};
