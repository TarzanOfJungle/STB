// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatMessageNotification {
  int get shoppingId => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatMessageNotificationCopyWith<ChatMessageNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageNotificationCopyWith<$Res> {
  factory $ChatMessageNotificationCopyWith(ChatMessageNotification value,
          $Res Function(ChatMessageNotification) then) =
      _$ChatMessageNotificationCopyWithImpl<$Res, ChatMessageNotification>;
  @useResult
  $Res call({int shoppingId, int senderId, String title, String message});
}

/// @nodoc
class _$ChatMessageNotificationCopyWithImpl<$Res,
        $Val extends ChatMessageNotification>
    implements $ChatMessageNotificationCopyWith<$Res> {
  _$ChatMessageNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? senderId = null,
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageNotificationImplCopyWith<$Res>
    implements $ChatMessageNotificationCopyWith<$Res> {
  factory _$$ChatMessageNotificationImplCopyWith(
          _$ChatMessageNotificationImpl value,
          $Res Function(_$ChatMessageNotificationImpl) then) =
      __$$ChatMessageNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int shoppingId, int senderId, String title, String message});
}

/// @nodoc
class __$$ChatMessageNotificationImplCopyWithImpl<$Res>
    extends _$ChatMessageNotificationCopyWithImpl<$Res,
        _$ChatMessageNotificationImpl>
    implements _$$ChatMessageNotificationImplCopyWith<$Res> {
  __$$ChatMessageNotificationImplCopyWithImpl(
      _$ChatMessageNotificationImpl _value,
      $Res Function(_$ChatMessageNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingId = null,
    Object? senderId = null,
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$ChatMessageNotificationImpl(
      shoppingId: null == shoppingId
          ? _value.shoppingId
          : shoppingId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatMessageNotificationImpl extends _ChatMessageNotification {
  const _$ChatMessageNotificationImpl(
      {required this.shoppingId,
      required this.senderId,
      required this.title,
      required this.message})
      : super._();

  @override
  final int shoppingId;
  @override
  final int senderId;
  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'ChatMessageNotification(shoppingId: $shoppingId, senderId: $senderId, title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageNotificationImpl &&
            (identical(other.shoppingId, shoppingId) ||
                other.shoppingId == shoppingId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, shoppingId, senderId, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageNotificationImplCopyWith<_$ChatMessageNotificationImpl>
      get copyWith => __$$ChatMessageNotificationImplCopyWithImpl<
          _$ChatMessageNotificationImpl>(this, _$identity);
}

abstract class _ChatMessageNotification extends ChatMessageNotification {
  const factory _ChatMessageNotification(
      {required final int shoppingId,
      required final int senderId,
      required final String title,
      required final String message}) = _$ChatMessageNotificationImpl;
  const _ChatMessageNotification._() : super._();

  @override
  int get shoppingId;
  @override
  int get senderId;
  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageNotificationImplCopyWith<_$ChatMessageNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
