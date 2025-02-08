import 'dart:async';

import 'package:generator/src/models/generation_strategy.dart';
import 'package:generator/src/models/password.dart';
import 'package:generator/src/models/password_config.dart';

abstract interface class IPasswordGenerator {
  IPasswordGenerator();

  FutureOr<Password> generate({
    required GeneratorConfiguration configuration,
    required GenerationStrategy strategy,
  });
}

class PasswordGeneratorImpl implements IPasswordGenerator {
  @override
  FutureOr<Password> generate({
    required GeneratorConfiguration configuration,
    required GenerationStrategy strategy,
  }) {
    return strategy.generate(
      configuration: configuration,
    );
  }
}
