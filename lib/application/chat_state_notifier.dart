import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:estaec/application/chat_messages_state.dart';
import 'package:estaec/application/dio_provider.dart';
import 'package:estaec/application/rag_settings_notifier.dart';
import 'package:estaec/application/templates_state_notifier.dart';
import 'package:estaec/business/completion.dart';
import 'package:estaec/business/document.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
part 'chat_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class ChatStateNotifier extends _$ChatStateNotifier {
  @override
  ChatMessagesState build() {
    return ChatMessagesState.initial();
  }

  Future<void> callCompletion(types.Message message) async {
    state = state.copyWith(
        messages: List.unmodifiable([
      ...state.messages,
      message,
      types.TextMessage(
        id: const Uuid().v1(),
        author: const types.User(id: 'Assistant'),
        text: 'Laissez moi réfléchir...',
        status: types.Status.sending,
      )
    ]));
    await _completion(
      (message as types.TextMessage).text,
    );
  }

  Future<Map<String, dynamic>> _postCompletion(String prompt) async {
    try {
      var res = await ref.read(dioProvider).post(
        '/chat',
        data: {
          'message': prompt,
          'collection_name': "esta-raw-text-storage-dev",
          'template_id': ref.watch(templatesStateNotifierProvider).value?.selectedTemplateId,
          // ref.read(ragSettingsNotifierProvider).value?.collectionName ?? '',
          },
      );
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> _completion(String message) async {
    try {
      state = state.copyWith(isLoading: true);
      var completionRequest = await _postCompletion(message);
      var completion = Completion(
        text: completionRequest['completion'],
        documents: jsonDecode(completionRequest['docs'])
            .map(
              (e) => Document(
                content: e['content'],
                metadata: e['metadata'] as Map<String, dynamic>,
                score: e['score'],
              ),
            )
            .toList()
            .cast<Document>(),
        finalPrompt: completionRequest['final_prompt'],
      );
      var lastMessage = state.messages.last;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(lastMessage.id, jsonEncode(completion.toJson()));
      state = state.copyWith(
        isLoading: false,
        hasError: false,
        messages: List.unmodifiable(
          [
            ...state.messages.sublist(0, state.messages.length - 1),
            (lastMessage as types.TextMessage).copyWith(text: completion.text, status: types.Status.sent)
          ],
        ),
      );
    } on Exception catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        messages: List.unmodifiable(
          [
            ...state.messages,
            types.SystemMessage(
                id: const Uuid().v1(), text: "Une erreur s'est produite, veuillez réessayer. ${e.toString()}")
          ],
        ),
      );
    }
  }
}
