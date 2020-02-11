import 'package:tp3/app/config.dart';
import 'package:tp3/app/utils.dart';

import 'grapheme_model.dart';

class TrainModel {
  GraphemeModel _answer;
  List<GraphemeModel> _choices = [];
  List<String> _attempts = [];

  TrainModel() {
    reset();
  }

  void reset() {
    _choices.clear();
    while (_choices.length < Config.trainNbChoices) {
      final GraphemeModel graphemeModel = Utils.getRandomGraphemeModel();
      if(graphemeModel != _answer && !_choices.contains(graphemeModel)) _choices.add(graphemeModel);
    }
    _answer = _choices.first;
    _choices.shuffle();
    _attempts.clear();
  }

  String getSymbol() => _answer.symbol;

  String getFirstChoice() => _choices.first.translation;

  String getSecondChoice() => _choices.elementAt(1).translation;

  String getThirdChoice() => _choices.last.translation;

  void onChoiceClick(String choice) =>
      _isGoodAnswer(choice) ? reset() : _attempts.add(choice);

  bool isDisabled(String choice) => _attempts.contains(choice);

  bool _isGoodAnswer(String choice) => choice == _answer.translation;
}
