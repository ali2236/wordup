import 'package:flutter/material.dart';

import 'button_icon_colored_circle.dart';

class PlayPauseButton extends StatelessWidget {
  final bool playing;
  final VoidCallback onTap;
  const PlayPauseButton({super.key, required this.playing, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if(isDark){
      return GestureDetector(
        onTap: onTap,
        child: Icon(
          playing ? Icons.pause_circle_outline_rounded : Icons.play_circle_outline_rounded,
          size: 32
        ),
      );
    } else {
      return ColoredCircleIconButton(
        icon: Icon(
          playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
          size: 24,
          color: Theme.of(context).cardColor,
        ),
        backgroundColor: const Color(0xff39124f),
        size: 32,
        onTap: onTap,
      );
    }
  }
}
