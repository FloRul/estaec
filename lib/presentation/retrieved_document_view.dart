import 'dart:math';

import 'package:flutter/material.dart';
import 'package:estaec/business/document.dart';

class RetrievedDocumentView extends StatelessWidget {
  RetrievedDocumentView({super.key, required this.documents});

  final List<Document> documents;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        if (settings.name == '/') {
          builder = (BuildContext context) => documents.isEmpty
              ? const Center(
                  child: Text('Aucun documents'),
                )
              : ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var text = documents[index].content;
                    return Card(
                      child: ListTile(
                        title: Text('${text.substring(0, min(100, text.length - 1))}...'),
                        trailing: CircleAvatar(
                          backgroundColor: Color.lerp(Colors.orange, Colors.green, (documents[index].score - .5) / .5),
                          child: Text(
                            (documents[index].score * 100).toStringAsFixed(0),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        onTap: () {
                          _navigatorKey.currentState!.push(
                            MaterialPageRoute(
                              builder: (context) => DetailDocumentPage(document: documents[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
        } else {
          builder = (BuildContext context) => DetailDocumentPage(document: settings.arguments as Document);
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class DetailDocumentPage extends StatelessWidget {
  final Document document;

  const DetailDocumentPage({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Détails du Document'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Contenu:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(document.content),
              const SizedBox(height: 16.0),
              const Text('Métadonnées:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Clé')),
                    DataColumn(label: Text('Valeur')),
                  ],
                  rows: document.metadata.entries.map((entry) {
                    return DataRow(cells: [
                      DataCell(Text(entry.key)),
                      DataCell(Text(entry.value.toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
