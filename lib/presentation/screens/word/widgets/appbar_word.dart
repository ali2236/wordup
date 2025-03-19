import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/presentation/screens/word/page_word_viewmodel.dart';
import 'package:wordup/presentation/widgets/buttons/button_icon_colored_circle.dart';

import 'popup_menu_button_word.dart';

class WordAppBar extends StatelessWidget {
  const WordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<WordPageViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          ColoredCircleIconButton(
            icon: Icon(Icons.close_rounded, size: 32),
            onTap: () => Navigator.of(context).pop(),
            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          ),
          Spacer(),
          WordPopupMenuButton(word: vm.word),
        ],
      ),
    );
  }
}
