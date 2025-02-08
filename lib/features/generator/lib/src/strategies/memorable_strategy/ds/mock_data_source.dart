import 'dart:async';

import 'package:generator/src/models/word.dart';
import 'package:generator/src/models/word_role.dart';
import 'package:generator/src/strategies/memorable_strategy/ds/data_source.dart';

class MockDataSource implements InitialDataSource {
  final Set<String> _dictionary = {
    'simple',
    'paperweight',
    'fiction',
    'invitation',
  };

  @override
  Future<Stream<Word>> getWords() async {
    return Stream.fromIterable(
      _dictionary.map(
        (e) => Word(
          word: e,
          role: WordRole.noun,
          length: e.length,
        ),
      ),
    );
  }
}
