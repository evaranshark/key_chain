import 'package:generator/src/models/generation_strategy.dart';
import 'package:generator/src/models/password_config.dart';

abstract class PasswordGenerator {
  PasswordGenerator();

  String generate({
    required GeneratorConfiguration configuration,
    required GenerationStrategy strategy,
  });
}

class RandomPasswordGenerator extends PasswordGenerator {
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
