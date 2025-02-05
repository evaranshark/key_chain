import 'package:generator/src/models/generation_strategy.dart';
import 'package:generator/src/models/password_config.dart';

abstract interface class IPasswordGenerator {
  IPasswordGenerator();

  String generate({
    required GeneratorConfiguration configuration,
    required GenerationStrategy strategy,
  });
}

class PasswordGeneratorImpl implements IPasswordGenerator {
  @override
  String generate({
    required GeneratorConfiguration configuration,
    required GenerationStrategy strategy,
  }) {
    return strategy.generate(
      configuration: configuration,
    );
  }
}
