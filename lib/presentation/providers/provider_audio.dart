import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider extends ChangeNotifier {
  final _player = AudioPlayer();
  Uri? _currentUri;

  bool isPlaying(Uri uri) {
    return _player.playing && _currentUri == uri;
  }

  Future<void> play(Uri uri) async {
    if (_currentUri != uri) {
      await _player.stop();
      await _player.setUrl(uri.toString());
    }
    _currentUri = uri;
    notifyListeners();
    if (_player.playing) {
      await _player.stop();
    } else {
      await _player.play();
      _currentUri = null;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    await _player.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
