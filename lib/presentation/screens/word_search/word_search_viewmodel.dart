import 'package:flutter/material.dart';
import 'package:wordup/data/data.dart';
import 'package:wordup/data/repository/repository_word_info_minimal.dart';
import 'package:wordup/domain/domain.dart';

class WordSearchViewModel extends ChangeNotifier {
  var _query = '';
  var _results = <WordResult>[];
  var _loading = false;
  final WordInfoMinimalRepository _repository;

  WordSearchViewModel(this._repository);


  void updateQuery(String newQuery) {
    _query = newQuery;
    _results.clear();
    _loading = true;
    notifyListeners();

    _findWords().then((list) {
      _results = list;
      _loading = false;
      notifyListeners();
    });
  }

  List<WordResult> get words => _results;

  bool get loading => _loading;

  String get query => _query;

  Future<List<WordResult>> _findWords(){
    return _repository.getAll(StringQueryFilter(_query)).first;
  }

}