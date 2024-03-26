import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.freezed.dart';
part 'template.g.dart';

@freezed
class Template with _$Template {
  const factory Template({
    required String id,
    required String text,
    required String name,
    required Map<String, String> tags,
  }) = _Template;

  factory Template.fromJson(Map<String, Object?> json) => _$TemplateFromJson(json);
}
