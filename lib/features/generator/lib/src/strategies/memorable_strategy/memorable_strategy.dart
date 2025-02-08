import 'dart:async';
import 'dart:math';

import 'package:generator/src/models/generation_strategy.dart';
import 'package:generator/src/models/password.dart';
import 'package:generator/src/models/password_config.dart';
import 'package:generator/src/models/word.dart';
import 'package:generator/src/strategies/memorable_strategy/dictionary_provider.dart';
import 'package:generator/src/symbols/symbols.dart';

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
  FutureOr<Password> generate(
      {required GeneratorConfiguration configuration}) async {
    final word = await _dictionaryProvider.getWord();
    final symbolized = word.inSymbols;
    final password = <Symbol>[];
    _fillPassword(
      password,
      symbolized,
      configuration: configuration,
    );
    return Password.fromSymbols(symbols: password);
  }

  void _fillPassword(
    List<Symbol> password,
    List<Symbol> from, {
    required GeneratorConfiguration configuration,
  }) {
    final changeCases =
        configuration.useCapitalLetters && configuration.useLowerCaseLetters;
    final r = Random();
    var isUpperCase =
        changeCases ? r.nextBool() : configuration.useCapitalLetters;
    for (final symbol in from) {
      final newSymbol = _complicateSymbol(
        symbol,
        isUpperCase: isUpperCase,
        configuration: configuration,
      );
      password.add(newSymbol);
      if (!changeCases) return;
      if (newSymbol is Letter) {
        isUpperCase = !isUpperCase;
      } else {
        isUpperCase = r.nextBool();
      }
    }
    if (configuration.useDigits) {
      final amount = r.nextInt(2) + 4;
      for (var i = 0; i < amount; i++) {
        password.add(r.nextDigit());
      }
    }
    if (configuration.useSymbols) {
      final amount = r.nextInt(configuration.useDigits ? 1 : 3) + 2;
      for (var i = 0; i < amount; i++) {
        password.add(r.nextSpecialSymbol());
      }
    }
  }

  Symbol _complicateSymbol(
    Symbol from, {
    required GeneratorConfiguration configuration,
    bool isUpperCase = false,
  }) {
    if (from is! Letter) {
      return from;
    }
    final preResult = (isUpperCase ? from.upper : from.lower) as Letter;
    if (preResult.similars.isEmpty) {
      return preResult;
    }

    final symbolsToUse = <Symbol>[];
    if (configuration.useDigits) {
      symbolsToUse.addAll(preResult.similars.whereType<Digit>());
    }
    if (configuration.useSymbols) {
      symbolsToUse.addAll(preResult.similars.whereType<SpecialSymbol>());
    }
    if (symbolsToUse.isEmpty) {
      return preResult;
    }
    final r = Random();
    final candidate = symbolsToUse[r.nextInt(symbolsToUse.length)];

    return candidate;
  }
}

extension _StringSymbolize on Word {
  List<Symbol> get inSymbols => word.split('').map(Symbol.byValue).toList();
}
