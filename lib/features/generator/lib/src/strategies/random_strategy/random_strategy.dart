import 'dart:math';

import 'package:generator/src/models/generation_strategy.dart';
import 'package:generator/src/models/password_config.dart';

class RandomGenerationStrategy implements GenerationStrategy {
  final String _lowerCaseSymbols = 'abcdefghijklmnopqrstuvwxyz';
  final String _upperCaseSymbols = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _digits = '0123456789';
  final String _symbols = '!@#%^&*()-_=+[{]}:<.>/?';

  int _length;

  RandomGenerationStrategy({
    int length = 12,
  })  : assert(length >= 8 && length <= 30),
        _length = length;

  void updateLength({required int length}) {
    assert(length >= 8 && length <= 30);
    _length = length;
  }

  @override
  String generate({
    required GeneratorConfiguration configuration,
  }) {
    final random = Random.secure();

    var chars = '';
    if (configuration.useCapitalLetters) {
      chars += _upperCaseSymbols;
    }
    if (configuration.useLowerCaseLetters) {
      chars += _lowerCaseSymbols;
    }
    if (configuration.useDigits) {
      chars += _digits;
    }
    if (configuration.useSymbols) {
      chars += _symbols;
    }

    return String.fromCharCodes(Iterable.generate(
      _length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ));
  }
}
