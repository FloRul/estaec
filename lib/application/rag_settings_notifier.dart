import 'package:dio/dio.dart';
import 'package:estaec/application/dio_provider.dart';
import 'package:estaec/application/rag_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'rag_settings_notifier.g.dart';

@Riverpod(keepAlive: true)
class RagSettingsNotifier extends _$RagSettingsNotifier {
  @override
  Future<RagSettingsState> build() async {
    var availableCollections = await _fetchAvailableCollections();
    return RagSettingsState.initial(availableCollections: availableCollections);
  }

  set collectionName(String collectionName) =>
      state = AsyncValue.data(state.value!.copyWith(collectionName: collectionName));
  set sourceType(SourceType sourceType) => state = AsyncValue.data(state.value!.copyWith(sourceType: sourceType));

  Future<List<String>> _fetchAvailableCollections() async {
    return [];
    try {
      var res = await ref.read(dioProvider).get('/collections');
      return ((res.data as Map<String, dynamic>)['collections'] as List).map((e) => e as String).toList();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
