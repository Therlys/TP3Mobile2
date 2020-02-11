import 'package:flutter/material.dart';
import 'package:tp3/grapheme/train_model.dart';
import 'package:tp3/widget/choice_button.dart';

class TrainPage extends StatefulWidget {
  @override
  _TrainPageState createState() => _TrainPageState();

  TrainPage({Key key}) : super(key: key);
}

class _TrainPageState extends State<TrainPage>
    with AutomaticKeepAliveClientMixin {
  final trainModel = TrainModel();

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
                  trainModel.getSymbol(),
                  textScaleFactor: orientation == Orientation.portrait ? 16 : 7,
                ),
              ),
            ),
          ),
          ChoiceButton(
            text: trainModel.getFirstChoice(),
            onPressed: () => {_onChoiceClick(trainModel.getFirstChoice())},
            isDisabled: trainModel.isDisabled(trainModel.getFirstChoice()),
          ),
          ChoiceButton(
            text: trainModel.getSecondChoice(),
            onPressed: () => {_onChoiceClick(trainModel.getSecondChoice())},
            isDisabled: trainModel.isDisabled(trainModel.getSecondChoice()),
          ),
          ChoiceButton(
            text: trainModel.getThirdChoice(),
            onPressed: () => {_onChoiceClick(trainModel.getThirdChoice())},
            isDisabled: trainModel.isDisabled(trainModel.getThirdChoice()),
          ),
        ],
      );
    });
  }

  void _onChoiceClick(String choice) {
    setState(() {
      trainModel.onChoiceClick(choice);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
