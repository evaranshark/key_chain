import 'package:generator/src/models/word.dart';
import 'package:generator/src/models/word_role.dart';
import 'package:generator/src/strategies/memorable_strategy/ds/data_source.dart';
import 'package:generator/src/strategies/memorable_strategy/ds/mock_data_source.dart';
import 'package:generator/src/strategies/memorable_strategy/storage/drift_storage.dart';
import 'package:generator/src/strategies/memorable_strategy/storage/storage.dart';

/// Занимается получением и синхронизацией данных для словаря
abstract interface class DictionaryRepository {
  factory DictionaryRepository() => _DictionaryRepository(
        storage: DriftStorage(),
        // TODO: Switch to actual ds when implemented
        initialDataSource: MockDataSource(),
      );

  Future<void> load();

  Future<Word> getWord({
    int? length,
    WordRole wordRole = WordRole.noun, // default to noun
  });
}

/// Базовая имплементация
///
/// Использует два источника данных - из csv-файла (CsvDataSource) и из базы данных (DriftDataSource)
/// Если в базе данные есть, то использует их. В противном случае получает данные из CsvDataSource и заполняет ими DriftDataSource.
class _DictionaryRepository implements DictionaryRepository {
  final InitialDataSource _initialDataSource;
  final Storage _storage;

  _DictionaryRepository({
    required InitialDataSource initialDataSource,
    required Storage storage,
  })  : _initialDataSource = initialDataSource,
        _storage = storage;

  @override
  Future<Word> getWord({
    int? length,
    WordRole? wordRole,
  }) =>
      _storage.getWord(
        length: length,
        wordRole: wordRole,
      );

  @override
  Future<void> load() async {
    final isSynced = await _storage.preformCheck();
    if (isSynced) {
      return;
    }
    final stream = await _initialDataSource.getWords();
    await _storage.insertWords(words: stream);
  }
}
