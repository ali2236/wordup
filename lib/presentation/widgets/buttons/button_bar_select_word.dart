import 'package:flutter/material.dart';

class SelectWordButtonBar extends StatelessWidget {
  final String selectedWord;
  final Set<String> words;
  final void Function(String w) onWordSelected;

  const SelectWordButtonBar({
    super.key,
    required this.selectedWord,
    required this.words,
    required this.onWordSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children:
          words.map((w) {
            final selected = w == selectedWord;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: _SelectableWord(
                word: w,
                selected: selected,
                onTap: () => onWordSelected(w),
              ),
            );
          }).toList(),
    );
  }
}

class _SelectableWord extends StatelessWidget {
  final String word;
  final bool selected;
  final VoidCallback? onTap;

  const _SelectableWord({super.key, required this.word, this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            selected ? Color.lerp(Theme.of(context).colorScheme.secondary, Colors.black, 0.2) : Theme.of(context).colorScheme.brightness == Brightness.light ? Color(0xffD9DDED) : Color(0xff333333),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            word,
            style: TextStyle(color: selected ? Theme.of(context).colorScheme.onSecondary : null, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
