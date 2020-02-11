import 'package:flutter/material.dart';
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
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scrollbar(
          child: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: orientation == Orientation.portrait ? 2 : 3),
            itemCount: graphemes.length,
            itemBuilder: (_, i) {
              return new Card(
                elevation: 2.0,
                margin: EdgeInsets.all(4.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        graphemes
                            .elementAt(i)
                            .symbol,
                        textScaleFactor: 8.0,
                      ),
                      flex: 4,
                    ),
                    Expanded(
                      child: new Text(
                        graphemes
                            .elementAt(i)
                            .translation,
                        textScaleFactor: 1.5,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
