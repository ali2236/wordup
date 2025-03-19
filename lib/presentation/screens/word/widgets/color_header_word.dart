import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/presentation/screens/word/page_word_viewmodel.dart';

class WordHeaderBackdrop extends StatelessWidget {
  const WordHeaderBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    final vm  = context.watch<WordPageViewModel>();
    return SizedBox(
      height: vm.imageHeight,
      child: Container(color: Theme.of(context).colorScheme.tertiary),
    );
  }
}
