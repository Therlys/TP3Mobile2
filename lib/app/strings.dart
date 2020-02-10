//TODO : Créer la classe "Strings" pour contenir les chaines de caractères de l'application.
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class Strings {
  static const values = {
    "en": {
      "title": "Hiraganas",
      "learn": "Learn",
      "train": "Train",
    },
    "fr": {
      "title": "Hiraganas",
      "learn": "Apprendre",
      "train": "S'entraîner",
    }
  };

  final Map<String, String> _values;

  String get title => _values["title"];
  String get learn => _values["learn"];
  String get train => _values["train"];

  Strings(Locale locale) : _values = values[locale.languageCode];
  Strings.of(BuildContext context) : this(Localizations.localeOf(context));
}

class AppLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationsDelegate._internal();

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate._internal();

  @override
  bool isSupported(Locale locale) => Strings.values.containsKey(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => SynchronousFuture<Strings>(Strings(locale));

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}