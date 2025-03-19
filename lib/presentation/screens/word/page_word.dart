import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/presentation/screens/word/page_word_viewmodel.dart';
import 'package:wordup/presentation/screens/word/widgets/appbar_word.dart';
import 'package:wordup/presentation/screens/word/widgets/bar_bottom_word.dart';
import 'package:wordup/presentation/screens/word/widgets/image_header_word.dart';
import 'package:wordup/presentation/screens/word/widgets/section_compare.dart';
import 'package:wordup/presentation/screens/word/widgets/swiper_senses.dart';
import 'package:wordup/presentation/screens/word/widgets/swiper_tips.dart';
import 'package:wordup/presentation/screens/word/widgets/video_header_word.dart';

class WordPage extends StatelessWidget {
  final WordPageViewModel vm;

  const WordPage({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WordPageViewModel>.value(
      value: vm,
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.topCenter,
              children: [
                //WordHeaderBackdrop(),
                WordHeaderImage(),
                WordHeaderVideo(),
                WordAppBar(),
                Padding(
                  padding: EdgeInsets.only(top: vm.imageHeight - 40),
                  child: SensesSwiper(),
                ),
              ],
            ),
            TipsSwiper(),
            SizedBox(height: 16),
            if (vm.word.compare.isNotEmpty) WordCompareWithSection(),
          ],
        ),
        bottomNavigationBar: WordBottomBar(),
      ),
    );
  }
}
