import 'package:generator/src/strategies/memorable_strategy/word_role.dart';

/// Занимается получением и синхронизацией данных для словаря
abstract interface class DictionaryRepository {
  factory DictionaryRepository() => _DictionaryRepository();

  Future<void> load();

  Future<String> getWord({
    int? length,
    WordRole wordRole = WordRole.noun, // default to noun
  });
}

/// Базовая имплементация
///
/// Использует два источника данных - из csv-файла (CsvDataSource) и из базы данных (DriftDataSource)
/// Если в базе данные есть, то использует их. В противном случае получает данные из CsvDataSource и заполняет ими DriftDataSource.
class _DictionaryRepository implements DictionaryRepository {
  // final CsvDataSource _csvDataSource = CsvDataSource();
  // final DriftDataSource _driftDataSource = DriftDataSource();

  @override
  Future<String> getWord({int? length, WordRole wordRole = WordRole.noun}) {
    // TODO: implement getWord
    throw UnimplementedError();
  }

  @override
  Future<void> load() {
    // TODO: implement load
    throw UnimplementedError();
  }
}
