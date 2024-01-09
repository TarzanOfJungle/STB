// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserChatMessage _$UserChatMessageFromJson(Map<String, dynamic> json) {
  return _UserChatMessage.fromJson(json);
}

/// @nodoc
mixin _$UserChatMessage {
  int get id => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;
  int get receiverId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserChatMessageCopyWith<UserChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChatMessageCopyWith<$Res> {
  factory $UserChatMessageCopyWith(
          UserChatMessage value, $Res Function(UserChatMessage) then) =
      _$UserChatMessageCopyWithImpl<$Res, UserChatMessage>;
  @useResult
  $Res call(
      {int id, int senderId, int receiverId, String message, DateTime created});
}

/// @nodoc
class _$UserChatMessageCopyWithImpl<$Res, $Val extends UserChatMessage>
    implements $UserChatMessageCopyWith<$Res> {
  _$UserChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? message = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserChatMessageImplCopyWith<$Res>
    implements $UserChatMessageCopyWith<$Res> {
  factory _$$UserChatMessageImplCopyWith(_$UserChatMessageImpl value,
          $Res Function(_$UserChatMessageImpl) then) =
      __$$UserChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int senderId, int receiverId, String message, DateTime created});
}

/// @nodoc
class __$$UserChatMessageImplCopyWithImpl<$Res>
    extends _$UserChatMessageCopyWithImpl<$Res, _$UserChatMessageImpl>
    implements _$$UserChatMessageImplCopyWith<$Res> {
  __$$UserChatMessageImplCopyWithImpl(
      _$UserChatMessageImpl _value, $Res Function(_$UserChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? message = null,
    Object? created = null,
  }) {
    return _then(_$UserChatMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserChatMessageImpl extends _UserChatMessage {
  const _$UserChatMessageImpl(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      required this.message,
      required this.created})
      : super._();

  factory _$UserChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserChatMessageImplFromJson(json);

  @override
  final int id;
  @override
  final int senderId;
  @override
  final int receiverId;
  @override
  final String message;
  @override
  final DateTime created;

  @override
  String toString() {
    return 'UserChatMessage(id: $id, senderId: $senderId, receiverId: $receiverId, message: $message, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, senderId, receiverId, message, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserChatMessageImplCopyWith<_$UserChatMessageImpl> get copyWith =>
      __$$UserChatMessageImplCopyWithImpl<_$UserChatMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserChatMessageImplToJson(
      this,
    );
  }
}

abstract class _UserChatMessage extends UserChatMessage {
  const factory _UserChatMessage(
      {required final int id,
      required final int senderId,
      required final int receiverId,
      required final String message,
      required final DateTime created}) = _$UserChatMessageImpl;
  const _UserChatMessage._() : super._();

  factory _UserChatMessage.fromJson(Map<String, dynamic> json) =
      _$UserChatMessageImpl.fromJson;

  @override
  int get id;
  @override
  int get senderId;
  @override
  int get receiverId;
  @override
  String get message;
  @override
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  _$$UserChatMessageImplCopyWith<_$UserChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
