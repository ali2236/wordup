import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';

import '../page_word_viewmodel.dart';
import 'card_sense.dart';

class SensesSwiper extends StatelessWidget {
  const SensesSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<WordPageViewModel>();
    return SizedBox(
      height: vm.senseCardHeight,
      child: Swiper(
        loop: false,
        index: vm.word.senses.indexOf(vm.activeSense),
        viewportFraction: 0.9,
        itemCount: vm.word.senses.length,
        itemBuilder: (context, i) {
          final sense = vm.word.senses[i];
          return SenseCard(
            sense: sense,
            word: vm.word,
            setCardHeight: (double height) {
              vm.senseCardHeight = height;
            },
          );
        },
        onIndexChanged: (i) {
          final sense = vm.word.senses[i];
          vm.activeSense = sense;
        },
      ),
    );
  }
}
