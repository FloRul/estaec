import 'package:flutter/material.dart';

class PromptInspector extends StatelessWidget {
  const PromptInspector({
    super.key,
    this.prompt,
  });
  final String? prompt;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        prompt ?? '',
      ),
    );
  }
}
