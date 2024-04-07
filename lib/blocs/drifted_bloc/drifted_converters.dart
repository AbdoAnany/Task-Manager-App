import 'dart:convert';

import 'package:drift/drift.dart';

class DateTimeConverter extends TypeConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime? mapToDart(int? fromDb) {
    if (fromDb == null) return null;
    return DateTime.fromMicrosecondsSinceEpoch(fromDb);
  }

  @override
  int? mapToSql(DateTime? value) {
    if (value == null) return null;
    return value.microsecondsSinceEpoch;
  }
  
  @override
  DateTime fromSql(int fromDb) {
    // TODO: implement fromSql
    throw UnimplementedError();
  }
  
  @override
  int toSql(DateTime value) {
    // TODO: implement toSql
    throw UnimplementedError();
  }
}

class StateConverter extends TypeConverter<Map<String, dynamic>?, String> {
  const StateConverter();

  @override
  Map<String, dynamic>? mapToDart(String? fromDb) {
    if (fromDb == null) return null;
    return jsonDecode(fromDb);
  }

  @override
  String? mapToSql(Map<String, dynamic>? value) {
    if (value == null) return null;
    return jsonEncode(value);
  }
  
  @override
  Map<String, dynamic>? fromSql(String fromDb) {
    // TODO: implement fromSql
    throw UnimplementedError();
  }
  
  @override
  String toSql(Map<String, dynamic>? value) {
    // TODO: implement toSql
    throw UnimplementedError();
  }
}