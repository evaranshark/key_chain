import 'dart:async';

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
  FutureOr<String> generate(
      {required GeneratorConfiguration configuration}) async {
    final word = await _dictionaryProvider.getWord();
    final symbolized = _StringSymbolize().symbolize(word.word);
    return word.word;
  }
}

class _StringSymbolize {
  List<Symbol> symbolize(String word) {
    final result = List<Symbol>.empty(growable: true);
    for (final char in word.split('')) {
      result.add(Symbol(char));
    }
    return result;
  }
}
