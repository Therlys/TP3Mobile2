import 'package:flutter/material.dart';
import 'package:tp3/app/dimens.dart';
import 'package:tp3/model/grapheme_model.dart';

class GraphemeCard extends StatelessWidget {
  final GraphemeModel grapheme;
  final bool isShowingTranslation;

  const GraphemeCard({
    Key key,
    @required this.grapheme,
    this.isShowingTranslation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Expanded(
            child: FittedBox(
              child: Text(
                grapheme.symbol,
              ),
            ),
          ),
          if (isShowingTranslation)
            Padding(
              padding: const EdgeInsets.all(Dimens.paddingXSmall),
              child: Text(
                grapheme.translation,
                style: Theme.of(context).textTheme.title,
              ),
            ),
        ],
      ),
    );
  }
}
