import 'package:generator/src/models/password_config.dart';

// ignore: one_member_abstracts
abstract interface class GenerationStrategy {
  String generate({
    required GeneratorConfiguration configuration,
  });
}
