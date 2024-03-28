import 'package:estaec/business/template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_management_state.freezed.dart';
part 'template_management_state.g.dart';

@freezed
class TemplateManagementState with _$TemplateManagementState {
  const factory TemplateManagementState({
    required List<Template> templates,
    required String? selectedTemplateId,
  }) = _TemplateManagementState;

  factory TemplateManagementState.initial({
    List<Template>? templates,
  }) =>
      TemplateManagementState(
        templates: templates ?? [],
        selectedTemplateId: templates?.first.id,
      );

  factory TemplateManagementState.fromJson(Map<String, Object?> json) => _$TemplateManagementStateFromJson(json);
}
