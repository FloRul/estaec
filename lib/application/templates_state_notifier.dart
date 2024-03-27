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
    state = await AsyncValue.guard(() async {
      // Delete the template from the API
      final templates = await _fetchTemplates();
      var filteredTemplates = templates.where((template) => template.id != templateId).toList();
      return TemplateManagementState.initial(templates: filteredTemplates);
    });
  }

  Future<void> createTemplate(String name, String text) async {
    state = await AsyncValue.guard(() async {
      // Create the template in the API
      final templates = await _fetchTemplates();
      var newTemplate = Template(id: 'new', name: name, text: text, tags: {});
      return TemplateManagementState.initial(templates: [...templates, newTemplate]);
    });
  }

  Future<void> updateTemplate(String templateId, String name, String text) async {
    state = await AsyncValue.guard(() async {
      // Update the template in the API
      final templates = await _fetchTemplates();
      var updatedTemplates = templates.map((template) {
        if (template.id == templateId) {
          return template.copyWith(name: name, text: text);
        }
        return template;
      }).toList();
      return TemplateManagementState.initial(templates: updatedTemplates);
    });
  }
}
