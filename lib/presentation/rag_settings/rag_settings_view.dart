import 'package:estaec/presentation/rag_settings/session_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:estaec/application/rag_settings_notifier.dart';

class RagSettingsView extends ConsumerWidget {
  const RagSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ragSettings = ref.watch(ragSettingsNotifierProvider);
    final notifier = ref.read(ragSettingsNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: ragSettings.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, _) => Text('Error: $error'),
          data: (data) => Column(
            children: [
              DropdownButton<String>(
                hint: const Text('Sélectionner une collection'),
                isDense: true,
                isExpanded: true,
                borderRadius: BorderRadius.circular(15),
                padding: const EdgeInsets.symmetric(vertical: 8),
                value: data.collectionName,
                onChanged: (String? col) => notifier.collectionName = col ?? '',
                items: data.availableCollections.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const SessionSetting(),
            ],
          ),
        ),
      ),
    );
  }
}
