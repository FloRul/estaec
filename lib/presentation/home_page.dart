import 'package:estaec/application/documents_provider.dart';
import 'package:estaec/presentation/chat_view.dart';
import 'package:estaec/presentation/common/elevated_card.dart';
import 'package:estaec/presentation/rag_settings/prompt_inspector.dart';
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
  late PageController _pageController;
  String? _selectedMessageId;
  @override
  void initState() {
    super.initState();
    _controller = SidebarXController(selectedIndex: 0, extended: false);
    _pageController = PageController(initialPage: _controller.selectedIndex);
    _controller.addListener(() {
      _pageController.animateToPage(
        _controller.selectedIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _pageController.dispose();
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
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: _pageController,
                      onPageChanged: (index) {
                        _controller.selectIndex(index);
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChatView(
                            onMessageSelected: (messageId) => setState(
                              () => _selectedMessageId = messageId,
                            ),
                          ),
                        ),
                        const RagSettingsView(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ref.watch(completionGetterProvider(_selectedMessageId)).when(
                        data: (c) => Column(
                              children: [
                                Expanded(
                                  child: ElevatedCard(
                                    title: 'Inspecteur de prompt',
                                    child: PromptInspector(prompt: c?.finalPrompt),
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedCard(
                                    title: 'Documents',
                                    child: RetrievedDocumentView(
                                      documents: c?.documents ?? [],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (error, stackTrace) => Center(child: Text(error.toString()))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
