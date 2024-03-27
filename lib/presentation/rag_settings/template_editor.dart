import 'package:estaec/application/templates_state_notifier.dart';
import 'package:estaec/business/template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  TemplatesView(navigatorKey: _navigatorKey),
                  ElevatedButton(
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
                    child: const Text('Créer un nouveau prompt'),
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

class TemplatesView extends ConsumerWidget {
  const TemplatesView({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        data: (data) => ListView.builder(
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
                      navigatorKey.currentState!.push(
                        MaterialPageRoute(
                          builder: (context) => EditTemplate(
                            template: template,
                            navigatorKey: navigatorKey,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async => notifier.deleteTemplate(template.id),
                  ),
                ],
              ),
            );
          },
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
    var nameController = useTextEditingController(text: template?.name);
    var textController = useTextEditingController(text: template?.text);
    var formKey = useMemoized(() => GlobalKey<FormState>());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un nouveau prompt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? 'Ce champ est obligatoire' : null,
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nom'),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
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
                  maxLines: 5,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Validate the form
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  // Create the template
                  await ref
                      .read(templatesStateNotifierProvider.notifier)
                      .createTemplate(nameController.text, textController.text);
                  navigatorKey.currentState!.pop();
                },
                child: Text(template == null ? 'Créer' : 'Modifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
