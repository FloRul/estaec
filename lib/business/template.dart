// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'template.freezed.dart';
part 'template.g.dart';

@freezed
class Template with _$Template {
  const factory Template({
    required String id,
    @JsonKey(name: 'creation_date') String? creationDate,
    required String text,
    @JsonKey(name: 'template_name') required String templateName,
    required Map<String, String> tags,
  }) = _Template;

  factory Template.fromJson(Map<String, Object?> json) => _$TemplateFromJson(json);
}
