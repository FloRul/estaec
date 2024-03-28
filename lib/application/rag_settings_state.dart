import 'package:freezed_annotation/freezed_annotation.dart';
part 'rag_settings_state.freezed.dart';
part 'rag_settings_state.g.dart';

enum SourceType {
  email,
  chat,
  call,
}

@freezed
class RagSettingsState with _$RagSettingsState {
  const factory RagSettingsState({
    String? collectionName,
    required List<String> availableCollections,
    String? sessionId,
    SourceType? sourceType,
  }) = _RagSettingsState;
  
  factory RagSettingsState.initial({
    List<String>? availableCollections,
  }) =>
      RagSettingsState(
        collectionName: null,
        availableCollections: availableCollections ?? [],
        sessionId: null,
        sourceType: SourceType.chat,
      );
  factory RagSettingsState.fromJson(Map<String, Object?> json) => _$RagSettingsStateFromJson(json);
}
