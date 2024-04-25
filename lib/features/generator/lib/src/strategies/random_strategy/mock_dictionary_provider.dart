import 'package:generator/src/strategies/random_strategy/dictionary_provider.dart';

class MockDictionaryProvider extends DictionaryProvider {
  @override
  Set<String> get dictionary => {
        'simple',
        'paper',
        'fiction',
        'invitation',
      };
}
