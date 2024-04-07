import 'dart:async';

import 'package:task_manager/blocs/drifted_bloc/drifted_database.dart';
import 'package:task_manager/blocs/drifted_bloc/drifted_isolate.dart';
import 'package:collection/collection.dart';

abstract class Storage {
  DriftedStates? read(String key);
  Future<void> write(String key, dynamic state, DateTime updatedAt);
  Future<void> delete(String key);
  Stream<DriftedStates?>? watch(String key);
  Future<void> clear();
}



class DriftedStorage implements Storage {
  static DriftedStorage? _instance;
  static List<DriftedStates>? _states;
  static StreamController? _statesController;

  final DriftedDatabase _database;
  DriftedStorage(this._database);

  static Future<DriftedStorage> build() async{
    if(_instance != null) return _instance!;

    final database = await DriftedIsolate.createOrGetDatabase();
    _states = await database.getStates();

    _statesController = StreamController.broadcast();
    database.watch?.listen((dd) {
      _states = dd;
      _statesController?.add(null);
    });

    return _instance = DriftedStorage(database);
  }

  @override
  DriftedStates? read(String key) {
    final df = _states?.firstWhereOrNull((s) => s.key == key);
    return df;
  }

  @override
  Future<void> write(String key, state, DateTime updatedAt) => _database.insertOrReplaceState(
    DriftedStates(
    // key: key,
    //   state: state,
    //   updatedAt: updatedAt
    )
  );

  @override
  Future<void> delete(String key) => _database.deleteState(key);

  @override
  Stream<DriftedStates?>? watch(String key) {
    return _statesController?.stream.transform(singleStateOrNull(key));
  }

  @override
  Future<void> clear() => _database.clear();

  StreamTransformer<void, DriftedStates?> singleStateOrNull<T>(String key) {
    return StreamTransformer.fromHandlers(handleData: (data, sink) {
      sink.add(_states?.firstWhereOrNull((s) => s.key == key));
    });
  }
}