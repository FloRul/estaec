import 'package:estaec/application/templates_state_notifier.dart';
import 'package:estaec/business/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TemplateSettings extends ConsumerWidget {
  TemplateSettings({super.key});
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        if (settings.name == '/') {
          builder = (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Éditeur de prompt',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TemplatesListView(navigatorKey: _navigatorKey),
                  OutlinedButton(
                    onPressed: () {
                      // Open create template dialog
                      _navigatorKey.currentState!.push(
                        MaterialPageRoute(
                          builder: (context) => EditTemplate(
                            navigatorKey: _navigatorKey,
                          ),
                        ),
                      );
                    },
                    child: const Text('Créer un prompt'),
                  ),
                ],
              );
        } else {
          builder = (context) => EditTemplate(
                navigatorKey: _navigatorKey,
              );
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class TemplatesListView extends ConsumerStatefulWidget {
  const TemplatesListView({
    super.key,
    required this.navigatorKey,
  });
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TemplatesListViewState();
}

class _TemplatesListViewState extends ConsumerState<TemplatesListView> {
  int selectedTemplateIndex = 0;

  @override
  Widget build(BuildContext context) {
    final templates = ref.watch(templatesStateNotifierProvider);
    var notifier = ref.read(templatesStateNotifierProvider.notifier);

    return SizedBox(
      height: 300,
      child: templates.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (error, _) => Text('Error: $error'),
        data: (data) => ListView(
          children: data.templates.map((template) {
            final index = data.templates.indexOf(template);
            return ListTile(
              leading: Radio<int>(
                value: index,
                groupValue: selectedTemplateIndex,
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      selectedTemplateIndex = value;
                      ref.read(templatesStateNotifierProvider.notifier).selectTemplate(template.id);
                    });
                  }
                },
              ),
              title: Text(template.templateName),
              subtitle: Text(template.text),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Open template editor dialog
                      widget.navigatorKey.currentState!.push(
                        MaterialPageRoute(
                          builder: (context) => EditTemplate(
                            template: template,
                            navigatorKey: widget.navigatorKey,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async => await notifier.deleteTemplate(template.id),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class EditTemplate extends HookConsumerWidget {
  const EditTemplate({
    super.key,
    this.template,
    required this.navigatorKey,
  });

  final Template? template;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, ref) {
    var nameController = useTextEditingController(text: template?.templateName);
    var textController = useTextEditingController(text: template?.text);
    var formKey = useMemoized(() => GlobalKey<FormState>());
    return Scaffold(
      appBar: AppBar(
        title: Text(template == null ? 'Créer un nouveau prompt' : 'Modifier le prompt'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Ce champ est obligatoire' : null,
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nom'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    if (!value.contains(RegExp(r'{{ *documents *}}'))) {
                      return 'Le texte doit contenir le mot : "{{ documents }}"';
                    }
                    return null;
                  },
                  controller: textController,
                  decoration: const InputDecoration(labelText: 'Texte'),
                  minLines: 5,
                  maxLines: 20,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // Validate the form
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    // Create or update the template
                    try {
                      if (template == null) {
                        await ref
                            .read(templatesStateNotifierProvider.notifier)
                            .createTemplate(nameController.text, textController.text);
                      } else {
                        await ref.read(templatesStateNotifierProvider.notifier).updateTemplate(
                            template!.id, nameController.text, textController.text, template!.creationDate!);
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Une erreur est survenue: $e')));
                    }
                    navigatorKey.currentState!.pop();
                  },
                  child: Text(template == null ? 'Créer' : 'Modifier'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
