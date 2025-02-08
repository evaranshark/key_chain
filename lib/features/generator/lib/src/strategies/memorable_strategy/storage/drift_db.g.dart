// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $WordsTable extends Words with TableInfo<$WordsTable, DbWord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _stampMeta = const VerificationMeta('stamp');
  @override
  late final GeneratedColumn<String> stamp = GeneratedColumn<String>(
      'stamp', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 18),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<int> length = GeneratedColumn<int>(
      'length', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumnWithTypeConverter<WordRole, int> role =
      GeneratedColumn<int>('role', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<WordRole>($WordsTable.$converterrole);
  @override
  List<GeneratedColumn> get $columns => [id, stamp, word, length, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<DbWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stamp')) {
      context.handle(
          _stampMeta, stamp.isAcceptableOrUnknown(data['stamp']!, _stampMeta));
    } else if (isInserting) {
      context.missing(_stampMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    } else if (isInserting) {
      context.missing(_lengthMeta);
    }
    context.handle(_roleMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbWord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbWord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      stamp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stamp'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}length'])!,
      role: $WordsTable.$converterrole.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}role'])!),
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WordRole, int, int> $converterrole =
      const EnumIndexConverter<WordRole>(WordRole.values);
}

class DbWord extends DataClass implements Insertable<DbWord> {
  final int id;
  final String stamp;
  final String word;
  final int length;
  final WordRole role;
  const DbWord(
      {required this.id,
      required this.stamp,
      required this.word,
      required this.length,
      required this.role});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stamp'] = Variable<String>(stamp);
    map['word'] = Variable<String>(word);
    map['length'] = Variable<int>(length);
    {
      map['role'] = Variable<int>($WordsTable.$converterrole.toSql(role));
    }
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      stamp: Value(stamp),
      word: Value(word),
      length: Value(length),
      role: Value(role),
    );
  }

  factory DbWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbWord(
      id: serializer.fromJson<int>(json['id']),
      stamp: serializer.fromJson<String>(json['stamp']),
      word: serializer.fromJson<String>(json['word']),
      length: serializer.fromJson<int>(json['length']),
      role: $WordsTable.$converterrole
          .fromJson(serializer.fromJson<int>(json['role'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stamp': serializer.toJson<String>(stamp),
      'word': serializer.toJson<String>(word),
      'length': serializer.toJson<int>(length),
      'role': serializer.toJson<int>($WordsTable.$converterrole.toJson(role)),
    };
  }

  DbWord copyWith(
          {int? id,
          String? stamp,
          String? word,
          int? length,
          WordRole? role}) =>
      DbWord(
        id: id ?? this.id,
        stamp: stamp ?? this.stamp,
        word: word ?? this.word,
        length: length ?? this.length,
        role: role ?? this.role,
      );
  DbWord copyWithCompanion(WordsCompanion data) {
    return DbWord(
      id: data.id.present ? data.id.value : this.id,
      stamp: data.stamp.present ? data.stamp.value : this.stamp,
      word: data.word.present ? data.word.value : this.word,
      length: data.length.present ? data.length.value : this.length,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbWord(')
          ..write('id: $id, ')
          ..write('stamp: $stamp, ')
          ..write('word: $word, ')
          ..write('length: $length, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, stamp, word, length, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbWord &&
          other.id == this.id &&
          other.stamp == this.stamp &&
          other.word == this.word &&
          other.length == this.length &&
          other.role == this.role);
}

class WordsCompanion extends UpdateCompanion<DbWord> {
  final Value<int> id;
  final Value<String> stamp;
  final Value<String> word;
  final Value<int> length;
  final Value<WordRole> role;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.stamp = const Value.absent(),
    this.word = const Value.absent(),
    this.length = const Value.absent(),
    this.role = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required String stamp,
    required String word,
    required int length,
    required WordRole role,
  })  : stamp = Value(stamp),
        word = Value(word),
        length = Value(length),
        role = Value(role);
  static Insertable<DbWord> custom({
    Expression<int>? id,
    Expression<String>? stamp,
    Expression<String>? word,
    Expression<int>? length,
    Expression<int>? role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stamp != null) 'stamp': stamp,
      if (word != null) 'word': word,
      if (length != null) 'length': length,
      if (role != null) 'role': role,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? stamp,
      Value<String>? word,
      Value<int>? length,
      Value<WordRole>? role}) {
    return WordsCompanion(
      id: id ?? this.id,
      stamp: stamp ?? this.stamp,
      word: word ?? this.word,
      length: length ?? this.length,
      role: role ?? this.role,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stamp.present) {
      map['stamp'] = Variable<String>(stamp.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (length.present) {
      map['length'] = Variable<int>(length.value);
    }
    if (role.present) {
      map['role'] = Variable<int>($WordsTable.$converterrole.toSql(role.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('stamp: $stamp, ')
          ..write('word: $word, ')
          ..write('length: $length, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

abstract class _$WordsDB extends GeneratedDatabase {
  _$WordsDB(QueryExecutor e) : super(e);
  $WordsDBManager get managers => $WordsDBManager(this);
  late final $WordsTable words = $WordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words];
}

typedef $$WordsTableCreateCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  required String stamp,
  required String word,
  required int length,
  required WordRole role,
});
typedef $$WordsTableUpdateCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  Value<String> stamp,
  Value<String> word,
  Value<int> length,
  Value<WordRole> role,
});

class $$WordsTableFilterComposer extends Composer<_$WordsDB, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stamp => $composableBuilder(
      column: $table.stamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<WordRole, WordRole, int> get role =>
      $composableBuilder(
          column: $table.role,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$WordsTableOrderingComposer extends Composer<_$WordsDB, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stamp => $composableBuilder(
      column: $table.stamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));
}

class $$WordsTableAnnotationComposer extends Composer<_$WordsDB, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stamp =>
      $composableBuilder(column: $table.stamp, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<int> get length =>
      $composableBuilder(column: $table.length, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WordRole, int> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);
}

class $$WordsTableTableManager extends RootTableManager<
    _$WordsDB,
    $WordsTable,
    DbWord,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableAnnotationComposer,
    $$WordsTableCreateCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder,
    (DbWord, BaseReferences<_$WordsDB, $WordsTable, DbWord>),
    DbWord,
    PrefetchHooks Function()> {
  $$WordsTableTableManager(_$WordsDB db, $WordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> stamp = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<int> length = const Value.absent(),
            Value<WordRole> role = const Value.absent(),
          }) =>
              WordsCompanion(
            id: id,
            stamp: stamp,
            word: word,
            length: length,
            role: role,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String stamp,
            required String word,
            required int length,
            required WordRole role,
          }) =>
              WordsCompanion.insert(
            id: id,
            stamp: stamp,
            word: word,
            length: length,
            role: role,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WordsTableProcessedTableManager = ProcessedTableManager<
    _$WordsDB,
    $WordsTable,
    DbWord,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableAnnotationComposer,
    $$WordsTableCreateCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder,
    (DbWord, BaseReferences<_$WordsDB, $WordsTable, DbWord>),
    DbWord,
    PrefetchHooks Function()>;

class $WordsDBManager {
  final _$WordsDB _db;
  $WordsDBManager(this._db);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
}
