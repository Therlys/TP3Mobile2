import 'package:tp3/app/config.dart';
import 'package:tp3/app/utils.dart';

import 'grapheme_model.dart';

class TrainModel {
  GraphemeModel _answer;
  List<GraphemeModel> _choiceGraphemes = [];
  Set<String> _attempts = {};

  GraphemeModel get answer => _answer;

  List<String> get choices {
    List<String> _choices = [];
    for (int i = 0; i < _choiceGraphemes.length; i++) {
      _choices.add(_choiceGraphemes[i].translation);
    }
    return _choices;
  }

  TrainModel() {
    startNewGame();
  }

  void startNewGame() {
    _choiceGraphemes.clear();
    while (_choiceGraphemes.length < Config.trainNbChoices) {
      final GraphemeModel graphemeModel = Config.graphemes.random;
      if (graphemeModel != _answer) _choiceGraphemes.addElementIfNotExists(graphemeModel);
    }
    _answer = _choiceGraphemes.first;
    _choiceGraphemes.shuffle();
    _attempts.clear();
  }

  void onChoiceClick(String choice) => _isGoodAnswer(choice) ? startNewGame() : _attempts.add(choice);

  bool isDisabled(String choice) => _attempts.contains(choice);

  bool _isGoodAnswer(String choice) => choice == _answer.translation;
}
