import 'package:flutter/material.dart';
import 'package:tp3/app/dimens.dart';
import 'package:tp3/widget/grapheme_card.dart';

import '../app/config.dart';

class LearnPage extends StatelessWidget {
  LearnPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scrollbar(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait
                    ? Dimens.nbOfLearnColumnsInPortraitOrientation
                    : Dimens.nbOfLearnColumnsInLandscapeOrientation),
            itemCount: Config.graphemes.length,
            itemBuilder: (_, i) {
              return GraphemeCard(grapheme: Config.graphemes.elementAt(i), isShowingTranslation: true);
            },
          ),
        );
      },
    );
  }
}
