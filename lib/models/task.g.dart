// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      date: const DateTimeSerializer().fromJson(json['date'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt:
          const DateTimeSerializer().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeSerializer().fromJson(json['updatedAt'] as String),
      deletedAt: const NullableDateTimeSerializer()
          .fromJson(json['deletedAt'] as String?),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'title': instance.title,
      'description': instance.description,
      'date': const DateTimeSerializer().toJson(instance.date),
      'isCompleted': instance.isCompleted,
      'createdAt': const DateTimeSerializer().toJson(instance.createdAt),
      'updatedAt': const DateTimeSerializer().toJson(instance.updatedAt),
      'deletedAt':
          const NullableDateTimeSerializer().toJson(instance.deletedAt),
    };
