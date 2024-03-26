import 'package:estaec/presentation/common/elevated_card.dart';
import 'package:estaec/presentation/rag_settings/collection_dropdown.dart';
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
    return const ElevatedCard(
      title: 'Paramètres',
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TemplateEditor(),
              SizedBox(height: 20),
              SessionSetting(),
              SizedBox(height: 20),
              InferenceSettings(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
