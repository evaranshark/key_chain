import 'package:drift/drift.dart';
import 'package:generator/src/config.dart';
import 'package:generator/src/models/word.dart';
import 'package:generator/src/models/word_role.dart';
import 'package:generator/src/strategies/memorable_strategy/storage/drift_db.dart';
import 'package:generator/src/strategies/memorable_strategy/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class DriftStorage implements Storage {
  final WordsDB _db;

  DriftStorage() : _db = WordsDB();

  @override
  Future<Word> getWord({int? length, WordRole? wordRole}) async {
    final query = _db.select(_db.words)
      ..where((w) => _getFilter(
            w,
            length: length,
            wordRole: wordRole,
          ))
      ..orderBy(
        [
          (u) => OrderingTerm.random(),
        ],
      )
      ..limit(1);
    final result = await query.getSingle();
    return Word(
      word: result.word,
      length: result.length,
      role: result.role,
    );
  }

  Expression<bool> _getFilter(
    $WordsTable word, {
    int? length,
    WordRole? wordRole,
  }) {
    final filters = List<Expression<bool>>.empty(
      growable: true,
    );

    if (length != null) {
      filters.add(word.length.equals(length));
    }
    if (wordRole != null) {
      filters.add(word.role.equalsValue(wordRole));
    }
    return Expression.and(
      filters,
    );
  }

  @override
  Future<void> insertWords({
    required Stream<Word> words,
  }) async {
    await for (final word in words) {
      await _db.into(_db.words).insert(
            WordsCompanion.insert(
              word: word.word,
              stamp: '${word.word}:${word.role.index}',
              length: word.length,
              role: word.role,
            ),
            mode: InsertMode.insertOrIgnore,
          );
    }
  }

  /// If false => stored data is invalid
  @override
  Future<bool> preformCheck() async {
    final prefs = SharedPreferencesAsync();
    if (!await prefs.containsKey('dataVersion')) {
      return false;
    }
    final storedVersion = await prefs.getString('dataVersion');
    return storedVersion == DATA_VERSION;
  }
}
