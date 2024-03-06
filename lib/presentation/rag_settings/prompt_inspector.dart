import 'package:flutter/material.dart';

class PromptInspector extends StatelessWidget {
  const PromptInspector({
    super.key,
    this.prompt,
  });
  final String? prompt;

  @override
  Widget build(BuildContext context) {
    var regularSpans = prompt?.split(RegExp(r'<(\w+)>(.*?)<\/\1>', dotAll: true)) ?? [];
    var quoteReg = RegExp(r'<quotes>(.*?)<\quotes>', dotAll: true);
    var historyReg = RegExp(r'<history>(.*?)<\history>', dotAll: true);

    // String? quotes = quoteReg.allMatches(prompt ?? '').map((e) => e.group(1)).first;
    // String? history = historyReg.allMatches(prompt ?? '').map((e) => e.group(1)).first;

    return SingleChildScrollView(
      child: RichText(
        text: TextSpan(
          children: regularSpans.map((span) {
            if (span.startsWith('<') && span.endsWith('>')) {
              return TextSpan(
                text: span,
                style: const TextStyle(color: Colors.red), // Change color for XML tags
              );
            } else {
              return TextSpan(
                text: span,
                style: const TextStyle(color: Colors.black), // Change color for other text
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}
