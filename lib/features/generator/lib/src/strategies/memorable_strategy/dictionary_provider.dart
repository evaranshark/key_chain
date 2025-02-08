import 'package:generator/src/models/word.dart';
import 'package:generator/src/models/word_role.dart';
import 'package:generator/src/strategies/memorable_strategy/dictionary_repository.dart';

abstract interface class DictionaryProvider {
  Future<void> load();

  Future<Word> getWord({
    int? length,
    WordRole wordRole = WordRole.noun, // default to noun
  });
}

class DictionaryProviderImpl implements DictionaryProvider {
  final DictionaryRepository _repository;

  DictionaryProviderImpl({required DictionaryRepository repository})
      : _repository = repository;

  @override
  Future<Word> getWord({int? length, WordRole wordRole = WordRole.noun}) {
    return _repository.getWord(
      length: length,
      wordRole: wordRole,
    );
  }

  @override
  Future<void> load() {
    return _repository.load();
  }
}
