import 'package:flutter/material.dart';
import 'package:tp3/app/dimens.dart';
import 'package:tp3/grapheme/grapheme_model.dart';

import '../app/config.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();

  LearnPage({Key key}) : super(key: key);
}

class _LearnPageState extends State<LearnPage>
    with AutomaticKeepAliveClientMixin {
  final List<GraphemeModel> graphemes = Config.graphemes;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return OrientationBuilder(builder: (context, orientation) {
      return Scrollbar(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait
                  ? Dimens.nbOfLearnColumnsInPortraitOrientation
                  : Dimens.nbOfLearnColumnsInLandscapeOrientation),
          itemCount: graphemes.length,
          itemBuilder: (_, i) {
            return new Card(
              margin: EdgeInsets.all(Dimens.paddingXSmall),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      child: new Text(
                        graphemes.elementAt(i).symbol,
                      ),
                    ),
                    flex: 4,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.paddingXSmall),
                      child: FittedBox(
                        child: new Text(
                          graphemes.elementAt(i).translation,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
