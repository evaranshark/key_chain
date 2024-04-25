import 'dart:math';

import 'package:generator/src/models/generation_strategy.dart';
import 'package:generator/src/models/password_config.dart';

class RandomGenerationStrategy implements GenerationStrategy {
  final int length;

  final String _lowerCaseSymbols = 'abcdefghijklmnopqrstuvwxyz';
  final String _upperCaseSymbols = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _digits = '0123456789';
  final String _symbols = '!@#%^&*()-_=+[{]}|;:,<.>/?';

  RandomGenerationStrategy({
    required this.length,
  }) : assert(length > 8 && length <= 30);
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
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ));
  }
}
