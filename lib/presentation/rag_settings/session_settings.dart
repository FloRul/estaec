import 'package:estaec/application/rag_settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SessionSetting extends StatefulHookConsumerWidget {
  const SessionSetting({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SessionSetingState();
}

class _SessionSetingState extends ConsumerState<SessionSetting> {
  bool _useHistory = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Activer l'historique"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Switch(
              value: _useHistory,
              onChanged: (value) {
                setState(() {
                  _useHistory = value;
                });
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                enabled: _useHistory,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Id de session',
                ),
                onChanged: (String sessionId) {
                  ref.read(ragSettingsNotifierProvider.notifier).sessionId = sessionId;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
