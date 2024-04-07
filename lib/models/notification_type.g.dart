// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralNotificationImpl _$$GeneralNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$GeneralNotificationImpl(
      color: json['color'] == null
          ? const Color(0xFF008FFD)
          : const ColorSerializer().fromJson(json['color'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GeneralNotificationImplToJson(
        _$GeneralNotificationImpl instance) =>
    <String, dynamic>{
      'color': const ColorSerializer().toJson(instance.color),
      'runtimeType': instance.$type,
    };

_$ReminderNotificationImpl _$$ReminderNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$ReminderNotificationImpl(
      color: json['color'] == null
          ? const Color(0xFF5C5D9D)
          : const ColorSerializer().fromJson(json['color'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReminderNotificationImplToJson(
        _$ReminderNotificationImpl instance) =>
    <String, dynamic>{
      'color': const ColorSerializer().toJson(instance.color),
      'runtimeType': instance.$type,
    };

_$SecurityNotificationImpl _$$SecurityNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$SecurityNotificationImpl(
      color: json['color'] == null
          ? const Color(0xFFFF8700)
          : const ColorSerializer().fromJson(json['color'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SecurityNotificationImplToJson(
        _$SecurityNotificationImpl instance) =>
    <String, dynamic>{
      'color': const ColorSerializer().toJson(instance.color),
      'runtimeType': instance.$type,
    };

_$AdvertisementNotificationImpl _$$AdvertisementNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$AdvertisementNotificationImpl(
      color: json['color'] == null
          ? const Color(0xFFFFBF47)
          : const ColorSerializer().fromJson(json['color'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AdvertisementNotificationImplToJson(
        _$AdvertisementNotificationImpl instance) =>
    <String, dynamic>{
      'color': const ColorSerializer().toJson(instance.color),
      'runtimeType': instance.$type,
    };
