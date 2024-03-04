import 'package:estaec/application/documents_provider.dart';
import 'package:estaec/presentation/rigth_panel/retrieved_document_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RightPanelView extends ConsumerWidget {
  const RightPanelView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Column(children: [
      ref.watch(documentsGetterProvider(ref.watch(selectedMessageProvider))).when(
            data: (documents) => RetrievedDocumentView(
                  documents: documents,
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text(error.toString()))),
    ],);
  }
}