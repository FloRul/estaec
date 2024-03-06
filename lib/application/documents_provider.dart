import 'dart:convert';

import 'package:estaec/business/completion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'documents_provider.g.dart';

@riverpod
class CompletionGetter extends _$CompletionGetter {
  @override
  FutureOr<Completion?> build(String? completionId) async {
    try {
      if (completionId == null || completionId.isEmpty) return null;
      final prefs = await SharedPreferences.getInstance();
      var res = prefs.getString(completionId);
      if (res == null) return null;
      var completion = Completion.fromJson(jsonDecode(res));
      return completion;
    } catch (e) {
      throw Exception('Error while fetching documents: $e');
    }
  }
}
