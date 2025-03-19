import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/common/uris.dart';
import 'package:wordup/presentation/screens/word/page_word_viewmodel.dart';
import 'package:wordup/presentation/widgets/video/cached_video_player.dart';

class WordHeaderVideo extends StatelessWidget {
  const WordHeaderVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<WordPageViewModel>();
    final activeSense = vm.activeSense;
    if (activeSense.id == vm.word.primarySenseId) {
      return SizedBox(
        height: vm.imageHeight,
        child: CachedVideoPlayer(
          videoUrl:
              imageCDN
                  .resolve('/video/${vm.word.primarySenseId}.mp4')
                  .toString(),
          hasVideo: () {
            vm.hasVideo = true;
          },
        ),
      );
    } else {
      return Offstage();
    }
  }
}
