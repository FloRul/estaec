import 'package:estaec/application/rag_settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectionDropdown extends ConsumerWidget {
  const CollectionDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(ragSettingsNotifierProvider.notifier);
    final ragSettings = ref.watch(ragSettingsNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Collection',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ragSettings.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, _) => Text('Error: $error'),
          data: (data) => DropdownButton<String>(
            hint: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Sélectionner une collection'),
            ),
            isDense: true,
            isExpanded: false,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.symmetric(vertical: 8),
            value: data.collectionName,
            onChanged: (String? col) => notifier.collectionName = col ?? '',
            items: data.availableCollections.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
