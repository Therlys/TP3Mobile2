import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tp3/app/strings.dart';
import 'package:tp3/grapheme/grapheme_route.dart';

import 'config.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: Strings.values.keys.map((it) => Locale(it)),
        localizationsDelegates: [
          AppLocalizationsDelegate.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      home: GraphemeRoute(graphemes: Config.graphemes,
      )
    );
  }
}
