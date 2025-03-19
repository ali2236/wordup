import 'package:flutter/material.dart';

class WordText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign alignment;
  final Map<String, Color>? highlightWord;

  const WordText(
    this.text, {
    super.key,
    this.style,
    this.alignment = TextAlign.start,
    this.highlightWord,
  });

  TextSpan buildSpan() {
    final words = text.split(' ').expand((word) {
      if (word.contains('\r\n')) {
        final parts = word.split('\r\n');
        return [...parts.take(parts.length - 1).expand((p) => [p, '\r\n']), parts.last];
      } else if (word.contains('\n')) {
        final parts = word.split('\n'); 
        return [...parts.take(parts.length - 1).expand((p) => [p, '\n']), parts.last];
      }
      return [word];
    }).toList();
    return TextSpan(
      children:
          words.indexed.map((wordIndex) {
            final (index, word) = wordIndex;
            final matchingEntry =
                highlightWord?.entries.where((entry) {
                  final importantWord = entry.key.toLowerCase().trim();
                  if (word.toLowerCase().trim().startsWith(importantWord)) {
                    return true;
                  }
                  //return entry.key.toLowerCase().trim() == word.toLowerCase().trim();
                  return false;
                }).firstOrNull;

            if (word == '◆' &&
                (index == 0 || words[index - 1].endsWith('\n'))) {
              return TextSpan(text: '$word ', style: style);
            }

            return TextSpan(
              text: word.endsWith('\n') ? word : '$word ',
              style:
                  matchingEntry != null
                      ? style?.copyWith(color: matchingEntry.value)
                      : style,
            );
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(text: buildSpan(), textAlign: alignment);
  }
}
