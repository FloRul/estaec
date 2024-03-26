import 'package:estaec/application/rag_settings_notifier.dart';
import 'package:estaec/application/templates_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TemplateEditor extends ConsumerWidget {
  const TemplateEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(templatesStateNotifierProvider.notifier);
    final templates = ref.watch(templatesStateNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Éditeur de prompt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        templates.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, _) => Text('Error: $error'),
          data: (data) => Expanded(
            child: ListView.builder(
              itemCount: data.templates.length,
              itemBuilder: (context, index) {
                final template = data.templates[index];
                return ListTile(
                  title: Text(template.name),
                  subtitle: Text(template.text),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Open template editor dialog
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Delete template
                          notifier.deleteTemplate(template.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Open create template dialog
          },
          child: const Text('Créer un nouveau prompt'),
        ),
      ],
    );
  }
}
