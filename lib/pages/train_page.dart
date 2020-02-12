import 'package:flutter/material.dart';
import 'package:tp3/app/dimens.dart';
import 'package:tp3/model/train_model.dart';
import 'package:tp3/widget/choice_button.dart';
import 'package:tp3/widget/grapheme_card.dart';

class TrainPage extends StatefulWidget {
  TrainPage({Key key}) : super(key: key);

  @override
  _TrainPageState createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> with AutomaticKeepAliveClientMixin {
  final trainModel = TrainModel();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(Dimens.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: GraphemeCard(
            grapheme: trainModel.answer,
            isShowingTranslation: false,
          )),
          for (String choice in trainModel.choices)
            ChoiceButton(
              text: choice,
              onPressed: () => {_onChoiceClick(choice)},
              isDisabled: trainModel.isDisabled(choice),
            ),
        ],
      ),
    );
  }

  void _onChoiceClick(String choice) {
    setState(() {
      trainModel.onChoiceClick(choice);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
