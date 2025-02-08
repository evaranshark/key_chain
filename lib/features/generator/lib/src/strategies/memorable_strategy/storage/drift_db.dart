import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:generator/src/models/word_role.dart';
import 'package:path_provider/path_provider.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [Words])
class WordsDB extends _$WordsDB {
  WordsDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'psw_generator_db',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationDocumentsDirectory,
      ),
    );
  }
}

@DataClassName('DbWord')
class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get stamp => text().withLength(min: 6, max: 30).unique()();
  TextColumn get word => text().withLength(min: 6, max: 18)();
  IntColumn get length => integer()();
  IntColumn get role => intEnum<WordRole>()();
}
