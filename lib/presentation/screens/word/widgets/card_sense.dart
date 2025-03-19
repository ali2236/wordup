import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:wordup/common/assets.dart';
import 'package:wordup/domain/entity/word_sense.dart';
import 'package:wordup/presentation/screens/word/page_word_viewmodel.dart';
import 'package:wordup/presentation/providers/provider_accent.dart';
import 'package:wordup/presentation/providers/provider_audio.dart';
import 'package:wordup/presentation/widgets/buttons/button_play_pause.dart';
import 'package:wordup/presentation/widgets/buttons/button_toggle_theme.dart';
import 'package:wordup/presentation/widgets/texts/text_word.dart';
import '../../../../domain/domain.dart';

class SenseCard extends StatefulWidget {
  final WordInfo word;
  final WordSense sense;
  final void Function(double height) setCardHeight;

  const SenseCard({
    super.key,
    required this.sense,
    required this.word,
    required this.setCardHeight,
  });

  @override
  State<SenseCard> createState() => _SenseCardState();
}

class _SenseCardState extends State<SenseCard>
    with AfterLayoutMixin<SenseCard> {
  final key = GlobalKey();
  late WordText wordText;

  String capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void initState() {
    super.initState();
    wordText = WordText(
      widget.sense.example,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final span = wordText.buildSpan();
    final painter = TextPainter(text: span, textDirection: TextDirection.ltr)
      ..layout(
        maxWidth:
            (key.currentContext?.findRenderObject() as RenderBox).size.width,
      );
    widget.setCardHeight(280 + painter.height);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleText = capitalizeFirstLetter(widget.sense.title);
    final phonetics =
        '/${widget.word.getPhonetics(AccentProvider.watch(context).accent)}/';

    return Card(
      key: key,
      margin: EdgeInsets.symmetric(horizontal: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Type
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          titleText,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            if(phonetics != '//') GestureDetector(
                              onTap:
                                  () => context.read<AudioProvider>().play(
                                    widget.word.wordPronunciation,
                                  ),
                              child: Image(
                                image: Svg(Assets.iconsSpeaker),
                                width: 30,
                                height: 30,
                                color: theme.iconTheme.color,
                              ),
                            ),
                            Text(
                              '${phonetics == '//' ? '' : '$phonetics '}#${widget.word.rank}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif'],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 8),
                      ToggleThemeButton(),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          widget.sense.type,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Phonetics and Type
            const Divider(height: 0),
            // Definition
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.sense.definition,
                    maxLines: 3,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Example
                  WordText(
                    widget.sense.example,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    highlightWord: {
                      widget.word.word: theme.colorScheme.primary,
                    },
                  ),
                ],
              ),
            ),

            Spacer(),
            // Bottom Actions
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      final audio = context.watch<AudioProvider>();
                      final uri =
                          widget
                              .word
                              .wordPronunciation; //context.watch<WordPageViewModel>().activeSense.audio;
                      final playing = audio.isPlaying(uri);
                      return PlayPauseButton(
                        playing: playing,
                        onTap:
                            playing
                                ? () {
                                  audio.stop();
                                }
                                : () {
                                  audio.play(uri);
                                },
                      );
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Translation',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
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
