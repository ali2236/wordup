import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:wordup/common/assets.dart';

import '../page_word_viewmodel.dart';
import 'card_tip.dart';

class TipsSwiper extends StatelessWidget {
  const TipsSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<WordPageViewModel>();
    final theme = Theme.of(context);
    final sense = vm.activeSense;
    final hasTips = sense.tips.isNotEmpty;
    if (!hasTips) {
      return Offstage();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            Spacer(),
            Image.asset(Assets.iconsLightBulb),
            SizedBox(width: 5),
            Text(
              'Pro Tips',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: theme.colorScheme.tertiary.withAlpha(200),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: Swiper(
            loop: false,
            viewportFraction: 0.9,
            index: sense.tips.indexOf(vm.selectedTip),
            itemCount: sense.tips.length,
            itemBuilder: (context, i) {
              final tip = sense.tips[i];
              return TipCard(tip: tip, word: vm.word);
            },
            onIndexChanged: (i) {
              final tip = sense.tips[i];
              vm.selectedTip = tip;
            },
          ),
        ),
      ],
    );
  }
}
