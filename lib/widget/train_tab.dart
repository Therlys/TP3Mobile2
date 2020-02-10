import 'package:flutter/material.dart';
import 'package:tp3/grapheme/grapheme_model.dart';
import 'package:tp3/widget/choice_button.dart';

import '../app/config.dart';

class TrainTab extends StatefulWidget {
  @override
  _TrainTabState createState() => _TrainTabState();
}

class _TrainTabState extends State<TrainTab>
    with AutomaticKeepAliveClientMixin {
  GraphemeModel _currentGrapheme;
  String _choice1;
  String _choice2;
  String _choice3;
  bool _isChoice1Disabled = false;
  bool _isChoice2Disabled = false;
  bool _isChoice3Disabled = false;

  @override
  void initState() {
    super.initState();
    _onGoodAnswerClick();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return OrientationBuilder(builder: (context, orientation) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: orientation == Orientation.portrait ? 6 : 4,
            child: new Card(
              elevation: 2.0,
              margin: EdgeInsets.all(8.0),
              child: Center(
                child: new Text(
                  _currentGrapheme.symbol,
                  textScaleFactor: orientation == Orientation.portrait ? 16 : 7,
                ),
              ),
            ),
          ),
          ChoiceButton(
            text: _choice1,
            onPressed: () => {_onChoiceClick(_choice1)},
            isDisabled: _isChoice1Disabled,
          ),
          ChoiceButton(
            text: _choice2,
            onPressed: () => {_onChoiceClick(_choice2)},
            isDisabled: _isChoice2Disabled,
          ),
          ChoiceButton(
            text: _choice3,
            onPressed: () => {_onChoiceClick(_choice3)},
            isDisabled: _isChoice3Disabled,
          ),
        ],
      );
    });
  }

  void _onChoiceClick(String choice) {
    if (_isGoodAnswer(choice)) {
      _onGoodAnswerClick();
    } else {
      setState(() {
        if (choice == _choice1)
          _isChoice1Disabled = true;
        else if (choice == _choice2)
          _isChoice2Disabled = true;
        else
          _isChoice3Disabled = true;
      });
    }
  }

  bool _isGoodAnswer(String choice) => choice == _currentGrapheme.translation;

  void _onGoodAnswerClick() {
    List<GraphemeModel> possibleGraphemes = [];
    while (possibleGraphemes.length < Config.trainNbChoices) {
      GraphemeModel graphemeModel = Config.getRandomGraphemeModel();
      if (!possibleGraphemes.contains(graphemeModel))
        possibleGraphemes.add(graphemeModel);
    }
    setState(() {
      _currentGrapheme = possibleGraphemes[Config.getRandomAnswerIndex()];
      _choice1 = possibleGraphemes[0].translation;
      _choice2 = possibleGraphemes[1].translation;
      _choice3 = possibleGraphemes[2].translation;
      _isChoice1Disabled = _isChoice2Disabled = _isChoice3Disabled = false;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
