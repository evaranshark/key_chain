import 'dart:math';

import 'package:generator/src/models/password_config.dart';

abstract class PasswordGenerator {
  final String _lowerCaseSymbols = 'abcdefghijklmnopqrstuvwxyz';
  final String _upperCaseSymbols = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _digits = '0123456789';
  final String _symbols = '!@#%^&*()-_=+[{]}|;:,<.>/?';

  PasswordGenerator();

  String generate({
    required GeneratorConfiguration configuration,
  });
}

class DefaultPasswordGenerator extends PasswordGenerator {
  @override
  String generate({
    required GeneratorConfiguration configuration,
  }) {
    final random = Random.secure();
    final length = configuration.length;
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
