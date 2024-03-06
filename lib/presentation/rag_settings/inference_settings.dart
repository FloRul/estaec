import 'package:estaec/application/rag_settings_notifier.dart';
import 'package:estaec/application/rag_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InferenceSettings extends ConsumerWidget {
  const InferenceSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(ragSettingsNotifierProvider.notifier);
    final ragSettings = ref.watch(ragSettingsNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Type d\'inférence',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Builder(
          builder: (context) {
            return DropdownButton<SourceType>(
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Sélectionner la longueur de la réponse'),
              ),
              isDense: true,
              isExpanded: false,
              borderRadius: BorderRadius.circular(15),
              padding: const EdgeInsets.symmetric(vertical: 8),
              value: ragSettings.value?.sourceType,
              onChanged: (value) => notifier.sourceType = value!,
              items: SourceType.values.map<DropdownMenuItem<SourceType>>((value) {
                return DropdownMenuItem<SourceType>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(value.toString().split('.').last),
                  ),
                );
              }).toList(),
            );
          }
        ),
      ],
    );
  }
}
