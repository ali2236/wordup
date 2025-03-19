import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/domain/domain.dart';
import 'package:wordup/presentation/screens/word_search/widgets/tile_list_word_result.dart';

import '../word_search_viewmodel.dart';

class WordResultList extends StatelessWidget {
  final void Function(WordResult word) onTap;
  const WordResultList({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WordSearchViewModel>();
    if (viewModel.loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.separated(
        itemCount: viewModel.words.length,
        itemBuilder: (context, i) {
          final word = viewModel.words[i];
          return WordResultListTile(word, onTap: () => onTap(word));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 0, thickness: 0.4);
        },
      );
    }
  }
}
