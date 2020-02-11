import 'package:tp3/grapheme/grapheme_model.dart';

class Config {
  static const List<GraphemeModel> graphemes = [
    /* - */
    GraphemeModel(symbol: "ん", translation: "n"),
    GraphemeModel(symbol: "あ", translation: "a"),
    GraphemeModel(symbol: "い", translation: "i"),
    GraphemeModel(symbol: "う", translation: "u"),
    GraphemeModel(symbol: "え", translation: "e"),
    GraphemeModel(symbol: "お", translation: "o"),
    /* k */
    GraphemeModel(symbol: "か", translation: "ka"),
    GraphemeModel(symbol: "き", translation: "ki"),
    GraphemeModel(symbol: "く", translation: "ku"),
    GraphemeModel(symbol: "け", translation: "ke"),
    GraphemeModel(symbol: "こ", translation: "ko"),
    /* s */
    GraphemeModel(symbol: "さ", translation: "sa"),
    GraphemeModel(symbol: "し", translation: "shi"),
    GraphemeModel(symbol: "す", translation: "su"),
    GraphemeModel(symbol: "せ", translation: "se"),
    GraphemeModel(symbol: "そ", translation: "so"),
    /* t */
    GraphemeModel(symbol: "た", translation: "ta"),
    GraphemeModel(symbol: "ち", translation: "chi"),
    GraphemeModel(symbol: "つ", translation: "tsu"),
    GraphemeModel(symbol: "て", translation: "te"),
    GraphemeModel(symbol: "と", translation: "to"),
    /* n */
    GraphemeModel(symbol: "な", translation: "na"),
    GraphemeModel(symbol: "に", translation: "ni"),
    GraphemeModel(symbol: "ぬ", translation: "nu"),
    GraphemeModel(symbol: "ね", translation: "ne"),
    GraphemeModel(symbol: "の", translation: "no"),
    /* h */
    GraphemeModel(symbol: "は", translation: "ha"),
    GraphemeModel(symbol: "ひ", translation: "hi"),
    GraphemeModel(symbol: "ふ", translation: "fu"),
    GraphemeModel(symbol: "へ", translation: "he"),
    GraphemeModel(symbol: "ほ", translation: "ho"),
    /* m */
    GraphemeModel(symbol: "ま", translation: "ma"),
    GraphemeModel(symbol: "み", translation: "mi"),
    GraphemeModel(symbol: "む", translation: "mu"),
    GraphemeModel(symbol: "め", translation: "me"),
    GraphemeModel(symbol: "も", translation: "mo"),
    /* r */
    GraphemeModel(symbol: "ら", translation: "ra"),
    GraphemeModel(symbol: "り", translation: "ri"),
    GraphemeModel(symbol: "る", translation: "ru"),
    GraphemeModel(symbol: "れ", translation: "re"),
    GraphemeModel(symbol: "ろ", translation: "ro"),
    /* y */
    GraphemeModel(symbol: "や", translation: "ya"),
    GraphemeModel(symbol: "ゆ", translation: "yu"),
    GraphemeModel(symbol: "よ", translation: "yo"),
    /* w */
    GraphemeModel(symbol: "わ", translation: "wa"),
    GraphemeModel(symbol: "を", translation: "wo"),
  ];

  static const int trainNbChoices = 3;
}
