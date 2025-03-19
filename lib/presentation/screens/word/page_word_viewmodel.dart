import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wordup/domain/domain.dart';

class WordPageViewModel with ChangeNotifier {
  final WordInfo word;

  WordPageViewModel(this.word): _sense = word.senses.first, _compare = word.compare.firstOrNull;

  final double imageHeight = 380.0;

  double _senseCardHeight = 300.0;
  double get senseCardHeight => _senseCardHeight;
  set senseCardHeight(double height){
    _senseCardHeight = max(height, _senseCardHeight);
    notifyListeners();
  }

  late WordSense _sense;
  WordSense get activeSense => _sense;
  set activeSense(WordSense sense){
    _sense = sense;
    _tip = sense.tips.firstOrNull;
    notifyListeners();
  }

  SenseTip? _tip;
  SenseTip get selectedTip => _tip ?? activeSense.tips.first;
  set selectedTip(SenseTip tip){
    _tip = tip;
    notifyListeners();
  }

  WordComparison? _compare;
  WordComparison? get selectedCompare => _compare;

  bool _hasVideo = false;
  bool get hasVideo => _hasVideo;
  set hasVideo(bool hasVideo) {
    _hasVideo = hasVideo;
    notifyListeners();
  }
  set selectedCompare(WordComparison? word){
    _compare = word;
    notifyListeners();
  }
}