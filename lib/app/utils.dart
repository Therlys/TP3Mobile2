import 'dart:math';

import 'config.dart';

class Utils {
  static final Random random = Random();
}

extension ListExtensions<T> on List<T> {
  T get random => this.elementAt(Utils.random.nextInt(Config.graphemes.length));

  void addElementIfNotExists(T element) {
    if (!this.contains(element)) this.add(element);
  }
}
