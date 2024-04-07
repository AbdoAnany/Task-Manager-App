// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drifted_database.dart';

// ignore_for_file: type=lint
class $DriftedStatesTable extends DriftedStates
    with TableInfo<$DriftedStatesTable, DriftedStatess> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftedStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      state = GeneratedColumn<String>('state', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>?>(
              $DriftedStatesTable.$converterstate);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> updatedAt =
      GeneratedColumn<int>('updated_at', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<DateTime>($DriftedStatesTable.$converterupdatedAt);
  @override
  List<GeneratedColumn> get $columns => [key, state, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drifted_states';
  @override
  VerificationContext validateIntegrity(Insertable<DriftedStatess> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    context.handle(_stateMeta, const VerificationResult.success());
    context.handle(_updatedAtMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  DriftedStatess map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftedStatess(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      state: $DriftedStatesTable.$converterstate.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!),
      updatedAt: $DriftedStatesTable.$converterupdatedAt.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!),
    );
  }

  @override
  $DriftedStatesTable createAlias(String alias) {
    return $DriftedStatesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>?, String> $converterstate =
      const StateConverter();
  static TypeConverter<DateTime, int> $converterupdatedAt =
      const DateTimeConverter();
}

class DriftedStatess extends DataClass implements Insertable<DriftedStatess> {
  final String key;
  final Map<String, dynamic>? state;
  final DateTime updatedAt;
  const DriftedStatess(
      {required this.key, this.state, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || state != null) {
      map['state'] =
          Variable<String>($DriftedStatesTable.$converterstate.toSql(state));
    }
    {
      map['updated_at'] = Variable<int>(
          $DriftedStatesTable.$converterupdatedAt.toSql(updatedAt));
    }
    return map;
  }

  DriftedStatesCompanion toCompanion(bool nullToAbsent) {
    return DriftedStatesCompanion(
      key: Value(key),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      updatedAt: Value(updatedAt),
    );
  }

  factory DriftedStatess.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftedStatess(
      key: serializer.fromJson<String>(json['key']),
      state: serializer.fromJson<Map<String, dynamic>?>(json['state']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'state': serializer.toJson<Map<String, dynamic>?>(state),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DriftedStatess copyWith(
          {String? key,
          Value<Map<String, dynamic>?> state = const Value.absent(),
          DateTime? updatedAt}) =>
      DriftedStatess(
        key: key ?? this.key,
        state: state.present ? state.value : this.state,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DriftedStatess(')
          ..write('key: $key, ')
          ..write('state: $state, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, state, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftedStatess &&
          other.key == this.key &&
          other.state == this.state &&
          other.updatedAt == this.updatedAt);
}

class DriftedStatesCompanion extends UpdateCompanion<DriftedStatess> {
  final Value<String> key;
  final Value<Map<String, dynamic>?> state;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DriftedStatesCompanion({
    this.key = const Value.absent(),
    this.state = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftedStatesCompanion.insert({
    required String key,
    required Map<String, dynamic>? state,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        state = Value(state),
        updatedAt = Value(updatedAt);
  static Insertable<DriftedStatess> custom({
    Expression<String>? key,
    Expression<String>? state,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (state != null) 'state': state,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftedStatesCompanion copyWith(
      {Value<String>? key,
      Value<Map<String, dynamic>?>? state,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return DriftedStatesCompanion(
      key: key ?? this.key,
      state: state ?? this.state,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(
          $DriftedStatesTable.$converterstate.toSql(state.value));
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(
          $DriftedStatesTable.$converterupdatedAt.toSql(updatedAt.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftedStatesCompanion(')
          ..write('key: $key, ')
          ..write('state: $state, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftedDatabase extends GeneratedDatabase {
  _$DriftedDatabase(QueryExecutor e) : super(e);
  _$DriftedDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $DriftedStatesTable driftedStates = $DriftedStatesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [driftedStates];
}
