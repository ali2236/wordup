import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/domain/repository/respository_word_info.dart';
import 'package:wordup/presentation/screens/word/page_word.dart';
import 'package:wordup/presentation/screens/word/page_word_viewmodel.dart';
import 'package:wordup/presentation/screens/word_search/widgets/list_word_result.dart';

import '../../core/core.dart';
import '../providers/provider_theme.dart';
import 'word_search/word_search_viewmodel.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: DrawerButtonIcon(),
        title: Text('Words'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.currentTheme.id == 'light'
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          //Image.asset(Assets.iconsKnowledgeMap),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) => WordSearchViewModel(locate())..updateQuery('happ'),
        builder: (context, _) {
          final search = context.read<WordSearchViewModel>();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: TextEditingController(text: search.query),
                  decoration: InputDecoration(
                    hintText: 'Search words...',
                    prefixIcon: Icon(Icons.search, size: 20),
                    filled: true,
                    fillColor: Theme.of(context).cardTheme.color,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onChanged: (value) {
                    search.updateQuery(value);
                  },
                ),
              ),
              Expanded(child: WordResultList(
                onTap: (word) async {
                  final navigator = Navigator.of(context);
                  final wordInfo = await locate<WordInfoRepository>().get(word.id).first;
                  final vm = WordPageViewModel(wordInfo);
                  navigator.push(MaterialPageRoute(builder: (context){
                    return WordPage(vm: vm);
                  }));
                },
              )),
            ],
          );
        },
      ),
    );
  }
}
