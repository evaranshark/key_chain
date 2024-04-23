import 'dart:math';

import 'package:generator/src/models/password_config.dart';

abstract class PasswordGenerator {
  PasswordGenerator();
  final lowerCaseSymbols = 'abcdefghijklmnopqrstuvwxyz';
  final upperCaseSymbols = 'abcdefghijklmnopqrstuvwxyz';
  final digits = r'0-9';
  final symbols = r'_-=+#$*&!?<>/';

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
    String result = '';

    return result;
  }
}
