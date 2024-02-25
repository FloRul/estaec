import 'dart:convert';

import 'package:estaec/business/completion.dart';
import 'package:estaec/business/document.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'documents_provider.g.dart';

@riverpod
class DocumentsGetter extends _$DocumentsGetter {
  @override
  FutureOr<List<Document>> build(String? messageId) async {
    try {
      if (messageId == null || messageId.isEmpty) return [];
      final prefs = await SharedPreferences.getInstance();
      var res = prefs.getString(messageId);
      if (res == null) return [];
      var completion = Completion.fromJson(jsonDecode(res));
      return completion.documents;
    } catch (e) {
      throw Exception('Error while fetching documents: $e');
    }
  }
}
