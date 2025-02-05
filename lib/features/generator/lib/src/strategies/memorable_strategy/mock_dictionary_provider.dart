import 'package:generator/src/strategies/memorable_strategy/dictionary_provider.dart';
import 'package:generator/src/strategies/memorable_strategy/word_role.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class MockDictionaryProvider implements DictionaryProvider {
  final Set<String> _dictionary = {
    'simple',
    'paper',
    'fiction',
    'invitation',
  };

  @override
  Future<void> load() {
    GetIt.I.get<Logger>().d('[MockDictionaryProvider] loading...');
    return Future.value();
  }

  @override
  Future<String> getWord(
      {int? length, WordRole wordRole = WordRole.noun}) async {
    return _dictionary.toList()[3];
  }
}
