import 'dart:math';

import 'package:tp3/grapheme/grapheme_model.dart';

import 'config.dart';

class Utils {
  static final Random _random = Random();

  static GraphemeModel getRandomGraphemeModel() =>
      Config.graphemes.elementAt(_random.nextInt(Config.graphemes.length));

  static int getRandomAnswerIndex() => _random.nextInt(Config.trainNbChoices);
}