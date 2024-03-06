import 'package:flutter/material.dart';

class PromptInspector extends StatelessWidget {
  const PromptInspector({
    super.key,
    this.prompt,
  });
  final String? prompt;

  @override
  Widget build(BuildContext context) {
    var spans = prompt?.split('') ?? [];

    return SingleChildScrollView(
      child: RichText(
        text: TextSpan(
          children: spans
              .map(
                (span) => TextSpan(
                  text: span,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
