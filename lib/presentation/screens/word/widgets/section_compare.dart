import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/presentation/widgets/buttons/button_bar_select_word.dart';
import 'package:wordup/presentation/widgets/texts/text_word.dart';

import '../page_word_viewmodel.dart';

class WordCompareWithSection extends StatelessWidget {
  const WordCompareWithSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final vm = context.watch<WordPageViewModel>();
    return Container(
      color: Theme.of(context).cardTheme.color,
      child: Builder(
        builder: (context) {
          final selectedCompare = vm.selectedCompare;
          return Column(
            children: [
              Row(children: [Spacer()]),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Compare with',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.tertiary.withAlpha(140),
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 4),
              if (vm.word.compare.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SelectWordButtonBar(
                    selectedWord: selectedCompare!.word,
                    words: vm.word.compare.map((w) => w.word).toSet(),
                    onWordSelected: (w) {
                      vm.selectedCompare = vm.word.compare.firstWhere(
                        (c) => c.word == w,
                      );
                    },
                  ),
                ),
              if (selectedCompare != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: WordText(
                    selectedCompare.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 16, height: 1.6),
                    highlightWord: {
                      vm.word.word: theme.colorScheme.primary,
                      /*for(var ot in vm.word.otherForms)
                                        ot : theme.colorScheme.primary,*/
                      selectedCompare.word: theme.colorScheme.secondary,
                      for (var ot in selectedCompare.info.otherForms)
                        ot: theme.colorScheme.secondary,
                    },
                  ),
                ),
              if (selectedCompare != null)
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CachedNetworkImage(
                    imageUrl: selectedCompare.info.image.toString(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
