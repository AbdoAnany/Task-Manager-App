// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationType _$NotificationTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'general':
      return GeneralNotification.fromJson(json);
    case 'reminder':
      return ReminderNotification.fromJson(json);
    case 'security':
      return SecurityNotification.fromJson(json);
    case 'advertisement':
      return AdvertisementNotification.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NotificationType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NotificationType {
  @ColorSerializer()
  Color get color => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@ColorSerializer() Color color) general,
    required TResult Function(@ColorSerializer() Color color) reminder,
    required TResult Function(@ColorSerializer() Color color) security,
    required TResult Function(@ColorSerializer() Color color) advertisement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@ColorSerializer() Color color)? general,
    TResult? Function(@ColorSerializer() Color color)? reminder,
    TResult? Function(@ColorSerializer() Color color)? security,
    TResult? Function(@ColorSerializer() Color color)? advertisement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@ColorSerializer() Color color)? general,
    TResult Function(@ColorSerializer() Color color)? reminder,
    TResult Function(@ColorSerializer() Color color)? security,
    TResult Function(@ColorSerializer() Color color)? advertisement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralNotification value) general,
    required TResult Function(ReminderNotification value) reminder,
    required TResult Function(SecurityNotification value) security,
    required TResult Function(AdvertisementNotification value) advertisement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralNotification value)? general,
    TResult? Function(ReminderNotification value)? reminder,
    TResult? Function(SecurityNotification value)? security,
    TResult? Function(AdvertisementNotification value)? advertisement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralNotification value)? general,
    TResult Function(ReminderNotification value)? reminder,
    TResult Function(SecurityNotification value)? security,
    TResult Function(AdvertisementNotification value)? advertisement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTypeCopyWith<NotificationType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTypeCopyWith<$Res> {
  factory $NotificationTypeCopyWith(
          NotificationType value, $Res Function(NotificationType) then) =
      _$NotificationTypeCopyWithImpl<$Res, NotificationType>;
  @useResult
  $Res call({@ColorSerializer() Color color});
}

/// @nodoc
class _$NotificationTypeCopyWithImpl<$Res, $Val extends NotificationType>
    implements $NotificationTypeCopyWith<$Res> {
  _$NotificationTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralNotificationImplCopyWith<$Res>
    implements $NotificationTypeCopyWith<$Res> {
  factory _$$GeneralNotificationImplCopyWith(_$GeneralNotificationImpl value,
          $Res Function(_$GeneralNotificationImpl) then) =
      __$$GeneralNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ColorSerializer() Color color});
}

/// @nodoc
class __$$GeneralNotificationImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$GeneralNotificationImpl>
    implements _$$GeneralNotificationImplCopyWith<$Res> {
  __$$GeneralNotificationImplCopyWithImpl(_$GeneralNotificationImpl _value,
      $Res Function(_$GeneralNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$GeneralNotificationImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralNotificationImpl implements GeneralNotification {
  const _$GeneralNotificationImpl(
      {@ColorSerializer() this.color = const Color(0xFF008FFD),
      final String? $type})
      : $type = $type ?? 'general';

  factory _$GeneralNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralNotificationImplFromJson(json);

  @override
  @JsonKey()
  @ColorSerializer()
  final Color color;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.general(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralNotificationImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralNotificationImplCopyWith<_$GeneralNotificationImpl> get copyWith =>
      __$$GeneralNotificationImplCopyWithImpl<_$GeneralNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@ColorSerializer() Color color) general,
    required TResult Function(@ColorSerializer() Color color) reminder,
    required TResult Function(@ColorSerializer() Color color) security,
    required TResult Function(@ColorSerializer() Color color) advertisement,
  }) {
    return general(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@ColorSerializer() Color color)? general,
    TResult? Function(@ColorSerializer() Color color)? reminder,
    TResult? Function(@ColorSerializer() Color color)? security,
    TResult? Function(@ColorSerializer() Color color)? advertisement,
  }) {
    return general?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@ColorSerializer() Color color)? general,
    TResult Function(@ColorSerializer() Color color)? reminder,
    TResult Function(@ColorSerializer() Color color)? security,
    TResult Function(@ColorSerializer() Color color)? advertisement,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralNotification value) general,
    required TResult Function(ReminderNotification value) reminder,
    required TResult Function(SecurityNotification value) security,
    required TResult Function(AdvertisementNotification value) advertisement,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralNotification value)? general,
    TResult? Function(ReminderNotification value)? reminder,
    TResult? Function(SecurityNotification value)? security,
    TResult? Function(AdvertisementNotification value)? advertisement,
  }) {
    return general?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralNotification value)? general,
    TResult Function(ReminderNotification value)? reminder,
    TResult Function(SecurityNotification value)? security,
    TResult Function(AdvertisementNotification value)? advertisement,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralNotificationImplToJson(
      this,
    );
  }
}

abstract class GeneralNotification implements NotificationType {
  const factory GeneralNotification({@ColorSerializer() final Color color}) =
      _$GeneralNotificationImpl;

  factory GeneralNotification.fromJson(Map<String, dynamic> json) =
      _$GeneralNotificationImpl.fromJson;

  @override
  @ColorSerializer()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$GeneralNotificationImplCopyWith<_$GeneralNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReminderNotificationImplCopyWith<$Res>
    implements $NotificationTypeCopyWith<$Res> {
  factory _$$ReminderNotificationImplCopyWith(_$ReminderNotificationImpl value,
          $Res Function(_$ReminderNotificationImpl) then) =
      __$$ReminderNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ColorSerializer() Color color});
}

/// @nodoc
class __$$ReminderNotificationImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$ReminderNotificationImpl>
    implements _$$ReminderNotificationImplCopyWith<$Res> {
  __$$ReminderNotificationImplCopyWithImpl(_$ReminderNotificationImpl _value,
      $Res Function(_$ReminderNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$ReminderNotificationImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderNotificationImpl implements ReminderNotification {
  const _$ReminderNotificationImpl(
      {@ColorSerializer() this.color = const Color(0xFF5C5D9D),
      final String? $type})
      : $type = $type ?? 'reminder';

  factory _$ReminderNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderNotificationImplFromJson(json);

  @override
  @JsonKey()
  @ColorSerializer()
  final Color color;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.reminder(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderNotificationImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderNotificationImplCopyWith<_$ReminderNotificationImpl>
      get copyWith =>
          __$$ReminderNotificationImplCopyWithImpl<_$ReminderNotificationImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@ColorSerializer() Color color) general,
    required TResult Function(@ColorSerializer() Color color) reminder,
    required TResult Function(@ColorSerializer() Color color) security,
    required TResult Function(@ColorSerializer() Color color) advertisement,
  }) {
    return reminder(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@ColorSerializer() Color color)? general,
    TResult? Function(@ColorSerializer() Color color)? reminder,
    TResult? Function(@ColorSerializer() Color color)? security,
    TResult? Function(@ColorSerializer() Color color)? advertisement,
  }) {
    return reminder?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@ColorSerializer() Color color)? general,
    TResult Function(@ColorSerializer() Color color)? reminder,
    TResult Function(@ColorSerializer() Color color)? security,
    TResult Function(@ColorSerializer() Color color)? advertisement,
    required TResult orElse(),
  }) {
    if (reminder != null) {
      return reminder(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralNotification value) general,
    required TResult Function(ReminderNotification value) reminder,
    required TResult Function(SecurityNotification value) security,
    required TResult Function(AdvertisementNotification value) advertisement,
  }) {
    return reminder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralNotification value)? general,
    TResult? Function(ReminderNotification value)? reminder,
    TResult? Function(SecurityNotification value)? security,
    TResult? Function(AdvertisementNotification value)? advertisement,
  }) {
    return reminder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralNotification value)? general,
    TResult Function(ReminderNotification value)? reminder,
    TResult Function(SecurityNotification value)? security,
    TResult Function(AdvertisementNotification value)? advertisement,
    required TResult orElse(),
  }) {
    if (reminder != null) {
      return reminder(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderNotificationImplToJson(
      this,
    );
  }
}

abstract class ReminderNotification implements NotificationType {
  const factory ReminderNotification({@ColorSerializer() final Color color}) =
      _$ReminderNotificationImpl;

  factory ReminderNotification.fromJson(Map<String, dynamic> json) =
      _$ReminderNotificationImpl.fromJson;

  @override
  @ColorSerializer()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$ReminderNotificationImplCopyWith<_$ReminderNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SecurityNotificationImplCopyWith<$Res>
    implements $NotificationTypeCopyWith<$Res> {
  factory _$$SecurityNotificationImplCopyWith(_$SecurityNotificationImpl value,
          $Res Function(_$SecurityNotificationImpl) then) =
      __$$SecurityNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ColorSerializer() Color color});
}

/// @nodoc
class __$$SecurityNotificationImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$SecurityNotificationImpl>
    implements _$$SecurityNotificationImplCopyWith<$Res> {
  __$$SecurityNotificationImplCopyWithImpl(_$SecurityNotificationImpl _value,
      $Res Function(_$SecurityNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$SecurityNotificationImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecurityNotificationImpl implements SecurityNotification {
  const _$SecurityNotificationImpl(
      {@ColorSerializer() this.color = const Color(0xFFFF8700),
      final String? $type})
      : $type = $type ?? 'security';

  factory _$SecurityNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecurityNotificationImplFromJson(json);

  @override
  @JsonKey()
  @ColorSerializer()
  final Color color;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.security(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityNotificationImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityNotificationImplCopyWith<_$SecurityNotificationImpl>
      get copyWith =>
          __$$SecurityNotificationImplCopyWithImpl<_$SecurityNotificationImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@ColorSerializer() Color color) general,
    required TResult Function(@ColorSerializer() Color color) reminder,
    required TResult Function(@ColorSerializer() Color color) security,
    required TResult Function(@ColorSerializer() Color color) advertisement,
  }) {
    return security(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@ColorSerializer() Color color)? general,
    TResult? Function(@ColorSerializer() Color color)? reminder,
    TResult? Function(@ColorSerializer() Color color)? security,
    TResult? Function(@ColorSerializer() Color color)? advertisement,
  }) {
    return security?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@ColorSerializer() Color color)? general,
    TResult Function(@ColorSerializer() Color color)? reminder,
    TResult Function(@ColorSerializer() Color color)? security,
    TResult Function(@ColorSerializer() Color color)? advertisement,
    required TResult orElse(),
  }) {
    if (security != null) {
      return security(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralNotification value) general,
    required TResult Function(ReminderNotification value) reminder,
    required TResult Function(SecurityNotification value) security,
    required TResult Function(AdvertisementNotification value) advertisement,
  }) {
    return security(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralNotification value)? general,
    TResult? Function(ReminderNotification value)? reminder,
    TResult? Function(SecurityNotification value)? security,
    TResult? Function(AdvertisementNotification value)? advertisement,
  }) {
    return security?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralNotification value)? general,
    TResult Function(ReminderNotification value)? reminder,
    TResult Function(SecurityNotification value)? security,
    TResult Function(AdvertisementNotification value)? advertisement,
    required TResult orElse(),
  }) {
    if (security != null) {
      return security(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SecurityNotificationImplToJson(
      this,
    );
  }
}

abstract class SecurityNotification implements NotificationType {
  const factory SecurityNotification({@ColorSerializer() final Color color}) =
      _$SecurityNotificationImpl;

  factory SecurityNotification.fromJson(Map<String, dynamic> json) =
      _$SecurityNotificationImpl.fromJson;

  @override
  @ColorSerializer()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$SecurityNotificationImplCopyWith<_$SecurityNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdvertisementNotificationImplCopyWith<$Res>
    implements $NotificationTypeCopyWith<$Res> {
  factory _$$AdvertisementNotificationImplCopyWith(
          _$AdvertisementNotificationImpl value,
          $Res Function(_$AdvertisementNotificationImpl) then) =
      __$$AdvertisementNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ColorSerializer() Color color});
}

/// @nodoc
class __$$AdvertisementNotificationImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res,
        _$AdvertisementNotificationImpl>
    implements _$$AdvertisementNotificationImplCopyWith<$Res> {
  __$$AdvertisementNotificationImplCopyWithImpl(
      _$AdvertisementNotificationImpl _value,
      $Res Function(_$AdvertisementNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$AdvertisementNotificationImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertisementNotificationImpl implements AdvertisementNotification {
  const _$AdvertisementNotificationImpl(
      {@ColorSerializer() this.color = const Color(0xFFFFBF47),
      final String? $type})
      : $type = $type ?? 'advertisement';

  factory _$AdvertisementNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertisementNotificationImplFromJson(json);

  @override
  @JsonKey()
  @ColorSerializer()
  final Color color;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.advertisement(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertisementNotificationImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertisementNotificationImplCopyWith<_$AdvertisementNotificationImpl>
      get copyWith => __$$AdvertisementNotificationImplCopyWithImpl<
          _$AdvertisementNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@ColorSerializer() Color color) general,
    required TResult Function(@ColorSerializer() Color color) reminder,
    required TResult Function(@ColorSerializer() Color color) security,
    required TResult Function(@ColorSerializer() Color color) advertisement,
  }) {
    return advertisement(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@ColorSerializer() Color color)? general,
    TResult? Function(@ColorSerializer() Color color)? reminder,
    TResult? Function(@ColorSerializer() Color color)? security,
    TResult? Function(@ColorSerializer() Color color)? advertisement,
  }) {
    return advertisement?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@ColorSerializer() Color color)? general,
    TResult Function(@ColorSerializer() Color color)? reminder,
    TResult Function(@ColorSerializer() Color color)? security,
    TResult Function(@ColorSerializer() Color color)? advertisement,
    required TResult orElse(),
  }) {
    if (advertisement != null) {
      return advertisement(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralNotification value) general,
    required TResult Function(ReminderNotification value) reminder,
    required TResult Function(SecurityNotification value) security,
    required TResult Function(AdvertisementNotification value) advertisement,
  }) {
    return advertisement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralNotification value)? general,
    TResult? Function(ReminderNotification value)? reminder,
    TResult? Function(SecurityNotification value)? security,
    TResult? Function(AdvertisementNotification value)? advertisement,
  }) {
    return advertisement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralNotification value)? general,
    TResult Function(ReminderNotification value)? reminder,
    TResult Function(SecurityNotification value)? security,
    TResult Function(AdvertisementNotification value)? advertisement,
    required TResult orElse(),
  }) {
    if (advertisement != null) {
      return advertisement(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertisementNotificationImplToJson(
      this,
    );
  }
}

abstract class AdvertisementNotification implements NotificationType {
  const factory AdvertisementNotification(
      {@ColorSerializer() final Color color}) = _$AdvertisementNotificationImpl;

  factory AdvertisementNotification.fromJson(Map<String, dynamic> json) =
      _$AdvertisementNotificationImpl.fromJson;

  @override
  @ColorSerializer()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$AdvertisementNotificationImplCopyWith<_$AdvertisementNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
