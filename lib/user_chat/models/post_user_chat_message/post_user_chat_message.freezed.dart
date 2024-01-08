// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_user_chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostUserChatMessage _$PostUserChatMessageFromJson(Map<String, dynamic> json) {
  return _PostUserChatMessage.fromJson(json);
}

/// @nodoc
mixin _$PostUserChatMessage {
  int get receiverId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostUserChatMessageCopyWith<PostUserChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUserChatMessageCopyWith<$Res> {
  factory $PostUserChatMessageCopyWith(
          PostUserChatMessage value, $Res Function(PostUserChatMessage) then) =
      _$PostUserChatMessageCopyWithImpl<$Res, PostUserChatMessage>;
  @useResult
  $Res call({int receiverId, String message});
}

/// @nodoc
class _$PostUserChatMessageCopyWithImpl<$Res, $Val extends PostUserChatMessage>
    implements $PostUserChatMessageCopyWith<$Res> {
  _$PostUserChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostUserChatMessageImplCopyWith<$Res>
    implements $PostUserChatMessageCopyWith<$Res> {
  factory _$$PostUserChatMessageImplCopyWith(_$PostUserChatMessageImpl value,
          $Res Function(_$PostUserChatMessageImpl) then) =
      __$$PostUserChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int receiverId, String message});
}

/// @nodoc
class __$$PostUserChatMessageImplCopyWithImpl<$Res>
    extends _$PostUserChatMessageCopyWithImpl<$Res, _$PostUserChatMessageImpl>
    implements _$$PostUserChatMessageImplCopyWith<$Res> {
  __$$PostUserChatMessageImplCopyWithImpl(_$PostUserChatMessageImpl _value,
      $Res Function(_$PostUserChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? message = null,
  }) {
    return _then(_$PostUserChatMessageImpl(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostUserChatMessageImpl extends _PostUserChatMessage {
  const _$PostUserChatMessageImpl(
      {required this.receiverId, required this.message})
      : super._();

  factory _$PostUserChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostUserChatMessageImplFromJson(json);

  @override
  final int receiverId;
  @override
  final String message;

  @override
  String toString() {
    return 'PostUserChatMessage(receiverId: $receiverId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUserChatMessageImpl &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, receiverId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUserChatMessageImplCopyWith<_$PostUserChatMessageImpl> get copyWith =>
      __$$PostUserChatMessageImplCopyWithImpl<_$PostUserChatMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostUserChatMessageImplToJson(
      this,
    );
  }
}

abstract class _PostUserChatMessage extends PostUserChatMessage {
  const factory _PostUserChatMessage(
      {required final int receiverId,
      required final String message}) = _$PostUserChatMessageImpl;
  const _PostUserChatMessage._() : super._();

  factory _PostUserChatMessage.fromJson(Map<String, dynamic> json) =
      _$PostUserChatMessageImpl.fromJson;

  @override
  int get receiverId;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$PostUserChatMessageImplCopyWith<_$PostUserChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
