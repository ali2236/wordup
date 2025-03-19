import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CachedVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VoidCallback hasVideo;

  const CachedVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.hasVideo,
  });

  @override
  State<CachedVideoPlayer> createState() => _CachedVideoPlayerState();
}

class _CachedVideoPlayerState extends State<CachedVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = widget.videoUrl.split('/').last;
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);

    if (await file.exists()) {
      // Use cached video file
      _controller = VideoPlayerController.file(file);
      widget.hasVideo();
    } else {
      // Download and cache the video
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      );
      // Cache the video after successful loading
      _controller.addListener(() {
        if (_controller.value.isInitialized && !file.existsSync()) {
          widget.hasVideo();
          _cacheVideo(widget.videoUrl, filePath);
        }
      });
    }

    return _controller.initialize().then((_) {
      _controller.play();
      _controller.setLooping(true);
      setState(() {});
    });
  }

  Future<void> _cacheVideo(String url, String filePath) async {
    try {
      final response = await HttpClient().getUrl(Uri.parse(url));
      final httpResponse = await response.close();
      final file = File(filePath);
      await httpResponse.pipe(file.openWrite());
    } catch (e) {
      debugPrint('Error caching video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          );
        }
        return Offstage();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
