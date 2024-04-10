// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodosResponse _$TodosResponseFromJson(Map<String, dynamic> json) =>
    TodosResponse(
      limit: json['limit'] as int?,
      skip: json['skip'] as int?,
      total: json['total'] as int?,
      data: (json['todos'] as List<dynamic>?)
          ?.map((e) => TodoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodosResponseToJson(TodosResponse instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'skip': instance.skip,
      'total': instance.total,
      'todos': instance.data,
    };

TodoData _$TodoDataFromJson(Map<String, dynamic> json) => TodoData(
      id: json['id'] as int?,
      todo: json['todo'] as String?,
      completed: json['completed'] as bool? ?? false,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$TodoDataToJson(TodoData instance) => <String, dynamic>{
      'id': instance.id,
      'todo': instance.todo,
      'completed': instance.completed,
      'userId': instance.userId,
    };
