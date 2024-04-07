import 'package:drift/drift.dart';
import 'package:task_manager/blocs/drifted_bloc/drifted_converters.dart';

part 'drifted_database.g.dart';

@DataClassName("DriftedStatess")
class DriftedStates extends Table {

  TextColumn get key => text()();
  TextColumn get state => text().map(const StateConverter())();
  IntColumn get updatedAt => integer().map(const DateTimeConverter())();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [DriftedStates])
class DriftedDatabase extends _$DriftedDatabase{
  DriftedDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
    );
  }

  static String get databasePortName => "DriftedDatabasePort";

  Future<void> insertOrReplaceState(DriftedStates state) async {
    try{
      // await into(state)
      //   .insert(state, mode: InsertMode.insertOrReplace);
    }
    catch(_) {}
  }

  Future<List<DriftedStates>?> getStates() async {
    try{
     // return  await select(DriftedStates).get();
      return [];
    }
    catch(_) {}
    return null;
  }

  Future<void> deleteState(String key) async {
    // try{
    //   await (delete(DriftedStates)
    //     ..where((s) => s.key.equals(key))
    //   ).go();
    // }
    // catch(_) {}
  }

  Stream<List<DriftedStates>>? get watch {
    // try{
    //   return select(DriftedStates).watch();
    // }
    // catch(_) {}
    return null;
  }

  Future<void> clear() async {
  //   try{
  //     await delete(DriftedStates).go();
  //   }
  //   catch(_) {}
  // }
}}