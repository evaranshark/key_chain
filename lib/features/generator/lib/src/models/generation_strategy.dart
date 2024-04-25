import 'package:generator/src/models/password_config.dart';

abstract interface class GenerationStrategy {
  String generate({
    required GeneratorConfiguration configuration,
  });
}
