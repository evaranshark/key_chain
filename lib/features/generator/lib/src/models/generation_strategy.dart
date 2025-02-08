import 'dart:async';

import 'package:generator/src/models/password.dart';
import 'package:generator/src/models/password_config.dart';

// ignore: one_member_abstracts
abstract interface class GenerationStrategy {
  FutureOr<Password> generate({
    required GeneratorConfiguration configuration,
  });
}
