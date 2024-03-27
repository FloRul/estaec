import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:estaec/application/chat_messages_state.dart';
import 'package:estaec/application/dio_provider.dart';
import 'package:estaec/application/rag_settings_notifier.dart';
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
      500,
    );
  }

  Future<Map<String, dynamic>> _fetchCompletion(String prompt, int maxTokens) async {
    try {
      var res = await ref.read(dioProvider).get(
        '/chat',
        queryParameters: {
          'query': prompt,
          'collectionName': "esta-raw-text-storage-dev",
          // ref.read(ragSettingsNotifierProvider).value?.collectionName ?? '',
          if (ref.read(ragSettingsNotifierProvider).value?.sessionId != null)
            'sessionId': ref.read(ragSettingsNotifierProvider).value!.sessionId,
        },
      );
      return res.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> _completion(String prompt, int maxTokens) async {
    try {
      state = state.copyWith(isLoading: true);
      var completionRequest = await _fetchCompletion(prompt, maxTokens);
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
