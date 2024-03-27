import 'package:dio/dio.dart';
import 'package:estaec/application/dio_provider.dart';
import 'package:estaec/application/template_management_state.dart';
import 'package:estaec/business/template.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'templates_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class TemplatesStateNotifier extends _$TemplatesStateNotifier {
  @override
  Future<TemplateManagementState> build() async {
    var templates = await _fetchTemplates();
    return TemplateManagementState.initial(templates: templates);
  }

  Future<void> _refresh() async {
    state = await AsyncValue.guard(() async {
      var templates = await _fetchTemplates();
      return TemplateManagementState.initial(templates: templates);
    });
  }

  Future<List<Template>> _fetchTemplates() async {
    try {
      var res = await ref.read(dioProvider).get('/templates');
      var templates = (res.data as List<dynamic>).map((e) => Template.fromJson(e as Map<String, dynamic>)).toList();
      return templates;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteTemplate(String templateId) async {
    // Delete the template from the API
    await ref.read(dioProvider).delete('/templates/$templateId}');
    await _refresh();
  }

  Future<void> createTemplate(String name, String text) async {
    // Create the template in the API
    await ref.read(dioProvider).post(
      '/templates',
      data: {
        'template_name': name,
        'text': text,
        'tags': {},
      },
    );
    await _refresh();
  }

  Future<void> updateTemplate(String templateId, String name, String text, String creationDate) async {
    // Update the template in the API
    await ref.read(dioProvider).post(
      '/templates',
      data: {
        'id': templateId,
        'template_name': name,
        'creation_date': creationDate,
        'text': text,
        'tags': {},
      },
    );
    await _refresh();
  }

  void selectTemplate(String templateId) {
    state = AsyncValue.data(state.value!.copyWith(selectedTemplateId: templateId));
  }
}
