import 'package:generator/src/models/generation_strategy.dart';
import 'package:generator/src/models/password_config.dart';
import 'package:generator/src/strategies/memorable_strategy/dictionary_provider.dart';

abstract interface class MemorableStrategy implements GenerationStrategy {
  factory MemorableStrategy({
    required DictionaryProvider dictionaryProvider,
  }) =>
      _MemorableStrategy(dictionaryProvider: dictionaryProvider);
}

class _MemorableStrategy implements MemorableStrategy {
  const _MemorableStrategy({
    required DictionaryProvider dictionaryProvider,
  }) : _dictionaryProvider = dictionaryProvider;

  final DictionaryProvider _dictionaryProvider;

  @override
  String generate({required GeneratorConfiguration configuration}) {
    // TODO: implement generate
    throw UnimplementedError();
  }
}
