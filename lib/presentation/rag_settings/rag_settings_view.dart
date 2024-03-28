import 'package:estaec/presentation/common/elevated_card.dart';
import 'package:estaec/presentation/rag_settings/inference_settings.dart';
import 'package:estaec/presentation/rag_settings/session_settings.dart';
import 'package:estaec/presentation/rag_settings/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RagSettingsView extends ConsumerWidget {
  const RagSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedCard(
      title: 'Paramètres',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: TemplateSettings()),
            const SizedBox(height: 20),
            const Expanded(child: SessionSetting()),
            const SizedBox(height: 20),
            const Expanded(child: InferenceSettings()),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
