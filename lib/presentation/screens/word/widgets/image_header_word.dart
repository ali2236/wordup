import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../page_word_viewmodel.dart';

class WordHeaderImage extends StatelessWidget {
  const WordHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<WordPageViewModel>();
    final activeSense = vm.activeSense;
    final hasVideo = vm.hasVideo;
    if (activeSense.id == vm.word.primarySenseId && hasVideo) {
      return Offstage();
    }
    return CachedNetworkImage(
      height: vm.imageHeight,
      imageUrl: activeSense.image.toString(),
      width: double.infinity,
      fit: BoxFit.cover,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
    );
  }
}
