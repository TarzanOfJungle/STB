// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groupchat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupchatMessage _$GroupchatMessageFromJson(Map<String, dynamic> json) {
  return _GroupchatMessage.fromJson(json);
}

/// @nodoc
mixin _$GroupchatMessage {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get shoppingId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime? get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupchatMessageCopyWith<GroupchatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupchatMessageCopyWith<$Res> {
  factory $GroupchatMessageCopyWith(
          GroupchatMessage value, $Res Function(GroupchatMessage) then) =
      _$GroupchatMessageCopyWithImpl<$Res, GroupchatMessage>;
  @useResult
  $Res call(
      {int id,
      int userId,
      int shoppingId,
      String message,
      DateTime created,
      DateTime? updated});
}

/// @nodoc
class _$GroupchatMessageCopyWithImpl<$Res, $Val extends GroupchatMessage>
    implements $GroupchatMessageCopyWith<$Res> {
  _$GroupchatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? shoppingId = null,
    Object? message = null,
    Object? created = null,
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupchatMessageImplCopyWith<$Res>
    implements $GroupchatMessageCopyWith<$Res> {
  factory _$$GroupchatMessageImplCopyWith(_$GroupchatMessageImpl value,
          $Res Function(_$GroupchatMessageImpl) then) =
      __$$GroupchatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      int shoppingId,
      String message,
      DateTime created,
      DateTime? updated});
}

/// @nodoc
class __$$GroupchatMessageImplCopyWithImpl<$Res>
    extends _$GroupchatMessageCopyWithImpl<$Res, _$GroupchatMessageImpl>
    implements _$$GroupchatMessageImplCopyWith<$Res> {
  __$$GroupchatMessageImplCopyWithImpl(_$GroupchatMessageImpl _value,
      $Res Function(_$GroupchatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? shoppingId = null,
    Object? message = null,
    Object? created = null,
    Object? updated = freezed,
  }) {
    return _then(_$GroupchatMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupchatMessageImpl extends _GroupchatMessage {
  const _$GroupchatMessageImpl(
      {required this.id,
      required this.userId,
      required this.shoppingId,
      required this.message,
      required this.created,
      this.updated})
      : super._();

  factory _$GroupchatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupchatMessageImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int shoppingId;
  @override
  final String message;
  @override
  final DateTime created;
  @override
  final DateTime? updated;

  @override
  String toString() {
    return 'GroupchatMessage(id: $id, userId: $userId, shoppingId: $shoppingId, message: $message, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupchatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, shoppingId, message, created, updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupchatMessageImplCopyWith<_$GroupchatMessageImpl> get copyWith =>
      __$$GroupchatMessageImplCopyWithImpl<_$GroupchatMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupchatMessageImplToJson(
      this,
    );
  }
}

abstract class _GroupchatMessage extends GroupchatMessage {
  const factory _GroupchatMessage(
      {required final int id,
      required final int userId,
      required final int shoppingId,
      required final String message,
      required final DateTime created,
      final DateTime? updated}) = _$GroupchatMessageImpl;
  const _GroupchatMessage._() : super._();

  factory _GroupchatMessage.fromJson(Map<String, dynamic> json) =
      _$GroupchatMessageImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int get shoppingId;
  @override
  String get message;
  @override
  DateTime get created;
  @override
  DateTime? get updated;
  @override
  @JsonKey(ignore: true)
  _$$GroupchatMessageImplCopyWith<_$GroupchatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
