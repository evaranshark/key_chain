import 'package:generator/src/strategies/memorable_strategy/word_role.dart';

abstract interface class DictionaryProvider {
  Future<void> load();

  Future<String> getWord({
    int? length,
    WordRole wordRole = WordRole.noun, // default to noun
  });
}
