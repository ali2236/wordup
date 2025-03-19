import 'package:flutter/material.dart';
import 'package:wordup/common/assets.dart';
import 'package:wordup/domain/domain.dart';
import 'package:wordup/presentation/widgets/buttons/button_play_pause.dart';
import 'package:wordup/presentation/widgets/texts/text_word.dart';

class TipCard extends StatelessWidget {
  final WordInfo word;
  final SenseTip tip;

  const TipCard({super.key, required this.tip, required this.word});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tip.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Spacer(),
                PlayPauseButton(playing: false, onTap: () {}),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(Assets.iconsFa),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(tip.definition, style: theme.textTheme.bodyMedium),
            SizedBox(height: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: WordText(
                        tip.example,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                        ),
                        highlightWord: {word.word: theme.colorScheme.primary},
                      ),
                    ),
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
