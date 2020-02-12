import 'package:tp3/app/config.dart';
import 'package:tp3/app/utils.dart';

import 'grapheme_model.dart';

class TrainModel {
  GraphemeModel _answer;
  List<GraphemeModel> _choiceGraphemes = [];
  List<String> _attempts = [];

  TrainModel() {
    onNewGame();
  }

  void onNewGame() {
    _choiceGraphemes.clear();
    while (_choiceGraphemes.length < Config.trainNbChoices) {
      final GraphemeModel graphemeModel = Utils.getRandomGraphemeModel();
      if(graphemeModel != _answer && !_choiceGraphemes.contains(graphemeModel)) _choiceGraphemes.add(graphemeModel);
    }
    _answer = _choiceGraphemes.first;
    _choiceGraphemes.shuffle();
    _attempts.clear();
  }

  String getSymbol() => _answer.symbol;

  void onChoiceClick(String choice) =>
      _isGoodAnswer(choice) ? onNewGame() : _attempts.add(choice);

  bool isDisabled(String choice) => _attempts.contains(choice);

  bool _isGoodAnswer(String choice) => choice == _answer.translation;
  
  List<String> getChoices(){
    List<String> _choices = [];
    for (int i = 0; i < _choiceGraphemes.length; i++){
      _choices.add(_choiceGraphemes[i].translation);
    }
    return _choices;
  }
}
