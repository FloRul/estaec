import 'package:estaec/application/documents_provider.dart';
import 'package:estaec/presentation/chat_view.dart';
import 'package:estaec/presentation/common/elevated_card.dart';
import 'package:estaec/presentation/rag_settings/rag_settings_view.dart';
import 'package:estaec/presentation/retrieved_document_view.dart';
import 'package:estaec/presentation/sidebar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomePage> {
  late SidebarXController _controller;
  String? _selectedMessageId;
  @override
  void initState() {
    super.initState();
    _controller = SidebarXController(selectedIndex: 0, extended: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SidebarView(controller: _controller),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          "Bienvenue sur le client d'évaluation ESTA",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Vous pouvez maintenant questionner une collection de données et obtenir les documents récupérés.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Expanded(
                          child: ElevatedCard(
                            child: ChatView(
                              onMessageSelected: (messageId) => setState(() => _selectedMessageId = messageId),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const IntrinsicHeight(
                          child: ElevatedCard(
                            title: 'Paramètres',
                            child: RagSettingsView(),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedCard(
                            title: 'Documents récupérés',
                            child: ref.watch(documentsGetterProvider(_selectedMessageId)).when(
                                data: (documents) => RetrievedDocumentView(
                                      documents: documents,
                                    ),
                                loading: () => const Center(child: CircularProgressIndicator()),
                                error: (error, stackTrace) => Center(child: Text(error.toString()))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
